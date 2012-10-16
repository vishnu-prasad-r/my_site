class LeaguesController < ApplicationController
  
  # team.won= number of sets won . team.lost= number of games won , team.draw= total matches
  def index
    @l=League.find_by_year(Date.today.year)
    if @l.nil? then 
      @l=League.new 
      @l.dirty=true
      end
    if (@l.dirty==true)
      
      @l.year=Date.today.year
      result=String.new
      Division.all.each do |division|
      @division=division
      generate(Date.today,division)
    #@teams=@teams.order("score DESC")
      @teams.sort! {|x,y| y.score <=> x.score}
      result= result + (render_to_string "temp",:layout=>false) + "<p>"
      end
      @l.dirty=false
      @l.result=result
      @l.save
      
    end
    @leagues= League.order("year DESC").page(params[:page]).per(1)
  end
  
  def new
    @league=League.new
  end
  
def destroy
    @league = League.find(params[:id])
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
  
  def create
    result=String.new
    #year=params[:league]["year(1i)"].to_i
    date = Date.new(params[:league]["year(1i)"].to_i,params[:league]["year(2i)"].to_i,params[:league]["year(3i)"].to_i)
    puts date
    Division.all.each do |division|
    @division=division
    generate(date,division)
    #@teams=@teams.order("score DESC")
    @teams.sort! {|x,y| y.score <=> x.score}
    result= result + (render_to_string "temp",:layout=>false) + "<p>"
    end
    @league= League.new
    @league.year=date.year
    @league.result=result
    @league.save
    redirect_to  leagues_url 
  end
  
  def showteam
    @t=Team.find(params[:id].to_i)
    @results=Result.where("team1=#{@t.id} OR team2=#{@t.id}").order("date DESC").page(params[:page])
  end
  
  private
    def generate(date,division)
      year= date.year
      results= Result.where(:date=>(Date.new(year, 1).beginning_of_month)..(date))
      @teams=Team.where(:division_id=>division.id)
      results.each do |r|
        if(r.fixture.try(:division)==division)
        t1gameswon = r.set1team1+ r.set2team1 + r.set3team1
        t2gameswon = r.set1team2+ r.set2team2+ r.set3team2
        t1setswon= (if r.set1team1==6 then 1 else 0 end) + (if r.set2team1==6 then 1 else 0 end) + (if r.set3team1==6 then 1 else 0 end)
        t2setswon= (if r.set1team2==6 then 1 else 0 end) + (if r.set2team2==6 then 1 else 0 end) + (if r.set3team2==6 then 1 else 0 end) 
        t1score= t1gameswon + (t1setswon*2)
        t2score= t2gameswon + (t2setswon*2)
        
        team1=Team.new
        team2=Team.new
        team1=@teams[@teams.index(r.team1)]
        if team1.won.nil? then team1.won=0 else team1.won= team1.won + t1gameswon end
        if team1.lost.nil? then team1.lost=0 else team1.lost = team1.lost + t1setswon end
        if team1.draw.nil? then team1.draw=0 else team1.draw= team1.draw+ 1 end
        if team1.score.nil? then team1.score=0 else team1.score= team1.score + t1score end
          
        
        team2=@teams[@teams.index(r.team2)]
        if team2.won.nil? then team2.won=0 else team2.won= team2.won + t2gameswon end
        if team2.lost.nil? then team2.lost=0 else team2.lost = team2.lost + t2setswon end
        if team2.draw.nil? then team2.draw=0 else team2.draw= team2.draw+ 1 end
        if team2.score.nil? then team2.score=0 else team2.score= team2.score + t2score end
       
    end
    end
  end  
end
