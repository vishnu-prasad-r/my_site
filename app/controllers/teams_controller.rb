class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
    before_filter :authenticate_user!#, :except => [:show,:index]
  def index
    @teams = Team.page(params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end
  
  def premier
    @teams = Team.where("division_id = ?", "1").page(params[:page])
    #Team.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
      format.html { render :template => "teams/index.html.erb" }# index.html.erb
      format.json { render json: @teams }
    end
  end
      def div1
    @teams = Team.where("division_id = ?", "2").page(params[:page])
    #Team.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "teams/index.html.erb" }# index.html.erb
          format.json { render json: @teams }
        end
      end
    
      def div2
    @teams = Team.where("division_id = ?", "3").page(params[:page])
    #Team.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "teams/index.html.erb" }# index.html.erb
          format.json { render json: @teams }
        end
      end
      def div3
    @teams = Team.where("division_id = ?", "4").page(params[:page])
    #Team.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "teams/index.html.erb" }# index.html.erb
          format.json { render json: @teams }
        end
    end
   
    def div4
    @teams = Team.where("division_id = ?", "5").page(params[:page])
    #Team.find (:all, :conditions => ['division_id < ?', ""], :order => 'start_date')
        respond_to do |format|
          format.html { render :template => "teams/index.html.erb" } # index.html.erb
          format.json { render json: @teams }
        end
    end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html  { render "new", :layout=>false}
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
      respond_to do |format|
      format.html  { render "edit", :layout=>false}
      
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { render :inline=>'<script type="text/javascript">parent.location.reload()</script>' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
     
  
end

