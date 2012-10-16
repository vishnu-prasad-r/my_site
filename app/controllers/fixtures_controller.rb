class FixturesController < ApplicationController
  # GET /fixtures
  # GET /fixtures.json
    before_filter :authenticate_user!#, :except => [:show,:index]
  def index
    @fixtures = Fixture.page(params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fixtures }
    end
  end

  # GET /fixtures/1
  # GET /fixtures/1.json
  def show
    @fixture = Fixture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fixture }
    end
  end

  # GET /fixtures/new
  # GET /fixtures/new.json
  def new
    @fixture = Fixture.new

    respond_to do |format|
      format.html  { render "new", :layout=>false}
      format.json { render json: @fixture }
    end
  end

  # GET /fixtures/1/edit
  def edit
    @fixture = Fixture.find(params[:id])
    respond_to do |format|
    format.html  { render "edit", :layout=>false}
    end
  end

  # POST /fixtures
  # POST /fixtures.json
  def create
    @fixture = Fixture.new(params[:fixture])

    respond_to do |format|
      if @fixture.save
        format.html { render :inline=> 'Fixture was successfully created.' }
        format.json { render json: @fixture, status: :created, location: @fixture }
      else
        format.html { render action: "new" }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fixtures/1
  # PUT /fixtures/1.json
  def update
    @fixture = Fixture.find(params[:id])

    respond_to do |format|
      if @fixture.update_attributes(params[:fixture])
        format.html { redirect_to @fixture, notice: 'Fixture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixtures/1
  # DELETE /fixtures/1.json
  def destroy
    @fixture = Fixture.find(params[:id])
    @fixture.destroy

    respond_to do |format|
      format.html { redirect_to fixtures_url }
      format.json { head :no_content }
    end
  end
  
  def sendfixtures
    @fixtures= Fixture.where(:date => (Time.now.to_date)..(1.year.from_now.to_date))
    
    #-----Dealing with Div1 fixtures
    5.times do |div|
      divfixtures=@fixtures.where(:division_id=>(div+1))
      divplayers=Player.where(:division_id=>(div+1))
      divsheet= generatefixture(divfixtures)
      emailfixture(divsheet,divplayers)
    end
    render :inline=> "Fixtures information for #{@fixtures.count} fictures in next one year will be soon mailed to players"
    #div1fixtures= @fixtures.where(:division_id=>1)
    #div1players=Player.where(:division_id=>1)
    #div1sheet= generatefixture(div1fixtures)
    #emailfixture(div1sheet,div1players)
    
    #div2fixtures= @fixtures.where(:division_id=>2)
    #div2players=Player.where(:division_id=>2)
    #div2sheet= generatefixture(div2fixtures)
    #emailfixture(div2sheet,div2players)
    
    #div3fixtures= @fixtures.where(:division_id=>3)
    #div3players=Player.where(:division_id=>3)
    #div3sheet= generatefixture(div3fixtures)
    #emailfixture(div3sheet,div3players)
    
    #div4fixtures= @fixtures.where(:division_id=>4)
    #div4players=Player.where(:division_id=>4)
    #div4sheet= generatefixture(div4fixtures)
    #emailfixture(div4sheet,div4players)
    
    #premierfixtures=@fixtures.where(:division_id=>5)
    #premierplayers=Player.where(:division_id=>5)
    #premiersheet= generatefixture(premierfixtures)
    #emailfixture(premiersheet,premierplayers)
  end
  
  def autogen
    
    #obtaining next 15 wednessdays
    @days=Array.new
    lastday= date_of_next("Wednesday")
    @days.push(lastday)
    
    14.times do |day|
      lastday=lastday.next_week.next_day(4)
      @days.push(lastday)
    end
    
    #shuffling the dates
    @days.shuffle!
    
    #Fixtures for first 3 divisions
    3.times do |i|
      teams=Team.where(:division_id=>(i+1))
      @div=Division.find(i+1)
      @j=0;
      teams.combination(2).to_a.each do |fix|
      fixture=Fixture.new
      fixture.teamone=fix[0]
      fixture.teamtwo=fix[1]
      fixture.division=@div
      
      @j=@j+1
      @j=(@j % @days.length)
      fixture.date=@days[@j]
      
      fixture.save
    end
      
    end
    #fixtures for division 4 and premier
    
    2.times do|i|
      @teams=Team.where(:division_id=>(i+4))
      @div=Division.find(i+4)
      @j=0
      combinations=@teams.map {|x| @teams.map {|y| 
        if x!=y then
         fixture=Fixture.new
         fixture.division=@div
         fixture.teamone=x
         fixture.teamtwo=y
         
         
         @j=@j+1
         @j=(@j % @days.length)
         fixture.date=@days[@j]
         
         fixture.save
         fixture
        end
         } }.flatten
    end
     
    @fixtures = Fixture.page(params[:page])
    render :action=>"index"
    
  end
  
  
    def remove
      if(params[:confirm] && params[:confirm]=="yes")
        
      @fixture= Fixture.where(:date => (Time.now.to_date)..(1.year.from_now.to_date)).delete_all
        respond_to do |format|
        format.html { redirect_to fixtures_url }
        format.json { head :no_content }
       end
       
      else
       @count= Fixture.where(:date => (Time.now.to_date)..(1.year.from_now.to_date)).count
       render :action=>"remove" , :layout=>false
      end
    end
  
  
  private
  
  
  
  def generatefixture(fixtures)
      book = Spreadsheet::Workbook.new
      sheet1 = book.create_worksheet  :name => 'Fixtures'
      bold = Spreadsheet::Format.new :weight => :bold
      6.times do |col| sheet1.row(0).set_format(col,bold) end
      sheet1.row(0).replace ["Date","Team One","Team Two","Division","Court"]
      @i=1;
      
      fixtures.each do |fixture|
        row=sheet1.row(@i)
        row[0]=fixture.date
        row[1]=fixture.teamone.Team_Name
        row[2]=fixture.teamtwo.Team_Name
        row[3]=fixture.division.name
        row[4]=fixture.court.try(:court)
        @i=@i+1
      end
      blob = StringIO.new("")
      book.write blob
      blob.string
  end
  
  def emailfixture(sheet,players)
    players.each do |p|
      if(!p.email.nil?)
        email=p.email.strip
        if !(email.gsub!(/\s+/, "").nil?)
          Postman.delay.sendfixtures(p.first_name,email,sheet)
        end
      end
    end
  end
  
  def date_of_next(day)
  date  = Date.parse(day)
  delta = date > Date.today ? 0 : 7
  date + delta
  end
  

  
end
