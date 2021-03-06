class PlayersController < ApplicationController
    before_filter :authenticate_user!#, :except => [:show,:index]
  helper_method :sort_column, :sort_direction
  # GET /players
  # GET /players.json
  def index
    
    #if (params[:division] && !Division.find(params[:division][:id].to_i).empty?)
     # puts "Reached here"
      #@players = Player.where(:division_id=>params[:division][:id].to_i).order(sort_column + ' ' + sort_direction).page(params[:page])
    #else
     # puts "Reached Else"
     # @players = Player.order(sort_column + ' ' + sort_direction).page(params[:page])
    #end
    @hash= Hash.new
    
    if(params[:division] && params[:division][:id])
     
      if !Division.find_by_id(params[:division][:id].to_i).nil?
        @hash.merge!({:division_id=>params[:division][:id].to_i})
      end
    end
    if(params[:pooled])
       @hash.merge!(:pot_luck=>toboolean(params[:pooled]))
    end
    if(!params[:name].nil? && !params[:name].empty?)
      @hash.merge!(:first_name=>params[:name])
    end
    
    if(@hash.empty?)
      @players = Player.order(sort_column + ' ' + sort_direction).page(params[:page])
    else
      @players = Player.where(@hash).order(sort_column + ' ' + sort_direction).page(params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end
  
  def premier
    @players = Player.where("division_id = ?", "1").order(sort_column + ' ' + sort_direction).page(params[:page])
    #Player.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
      format.html { render :template => "players/index.html.erb" }# index.html.erb
      format.json { render json: @players }
    end
  end
      def div1
    @players = Player.where("division_id = ?", "2").order(sort_column + ' ' + sort_direction).page(params[:page])
    #Player.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "players/index.html.erb" }# index.html.erb
          format.json { render json: @players }
        end
      end
    
      def div2
    @players = Player.where("division_id = ?", "3").order(sort_column + ' ' + sort_direction).page(params[:page])
    #Player.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "players/index.html.erb" }# index.html.erb
          format.json { render json: @players }
        end
      end
      def div3
    @players = Player.where("division_id = ?", "4").order(sort_column + ' ' + sort_direction).page(params[:page])
    #Player.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "players/index.html.erb" }# index.html.erb
          format.json { render json: @players }
        end
    end
   
    def div4
    @players = Player.where("division_id = ?", "5").order(sort_column + ' ' + sort_direction).page(params[:page])
    #Player.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "players/index.html.erb" } # index.html.erb
          format.json { render json: @players }
        end
    end
  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html  { render "new", :layout=>false}
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
      respond_to do |format|
      format.html  { render "edit", :layout=>false}
      
    end
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def generatecontactsheet
    @players=Player.all
    attachmentfile= createcontactsheet()
    @players.each do |player|
      if(!player.email.nil?)
        Postman.delay.sendcontactsheet(player,attachmentfile)
        puts "Queued mail for #{player.email}"
      end
    end
    send_data attachmentfile, :type => "application/vnd.ms-excel", :filename => "contactsheet.xls"
    
  end
  def mailcontactsheet
    
  end
  private
    
    def sort_column
      Player.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
    def createcontactsheet
      book = Spreadsheet::Workbook.new
      sheet1 = book.create_worksheet  :name => 'Contact info'
      bold = Spreadsheet::Format.new :weight => :bold
      6.times do |col| sheet1.row(0).set_format(col,bold) end
      sheet1.row(0).replace ["First Name","Last Name","Home Phone","Work Phone","Email","Address"]
      @i=1;
      @players= Player.all
      @players.each do |player|
        row=sheet1.row(@i)
        row[0]=player.first_name
        row[1]=player.last_name
        row[2]=player.Home_Phone
        row[3]=player.Work_Phone
        row[4]=player.email
        #row[5]=""+player.Address1+"\n"+player.Address2+"\n"+player.Address3+"\n"+player.Address4+"\n"+player.Address5+"\n"
        row[5]=(if player.Address1 then player.Address1 else "" end  ) + (if player.Address2 then " ,\n" + player.Address2 else "" end  )+ (if player.Address3 then " ,\n" + player.Address3 else "" end  )+ (if player.Address4 then " ,\n" + player.Address4 else "" end  )+ (if player.Address5 then " ,\n" + player.Address5 else "" end  )
        @i=@i+1
      end
      blob = StringIO.new("")
      book.write blob
      blob.string
    end
end
