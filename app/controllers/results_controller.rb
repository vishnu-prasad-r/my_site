class ResultsController < ApplicationController
    before_filter :authenticate_user!, :except => [:show,:index]
  # GET /results
  # GET /results.json
  def index
    
    @results = Result.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new
    @fixtures= Fixture.where(:date => (1.year.ago.to_date)..(Time.now.to_date)).order("date DESC")
  respond_to do |format|
      format.html  { render "new", :layout=>false}
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @fixtures= Fixture.where(:date => (1.year.ago.to_date)..(Time.now.to_date)).order("date DESC")
    @result = Result.find(params[:id])
      respond_to do |format|
      format.html  { render "edit", :layout=>false}
      
    end
  end

  # POST /results
  # POST /results.json
  def create
    
    fixture=Fixture.find(params[:result][:fixture_id])
    params[:result][:fixture_id]=nil
    @result = Result.new(params[:result])
   if(fixture.date<=Time.now.to_date)
    @result.teamone=fixture.teamone.Team_Name
    @result.teamtwo=fixture.teamtwo.Team_Name
    @result.court=fixture.court.try(:court)
    @result.date=fixture.date
    @result.fixture=fixture
    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
   else
     render :inline=>"Invalid fixture. Are you attempting to set result for a future fixture?"
   end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end
end
