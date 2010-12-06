class RatingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_wine

  # GET /wine/1/ratings
  # GET /wine/1/ratings.xml
  def index
    @ratings = @wine.ratings.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /wine/1/ratings/1
  # GET /wine/1/ratings/1.xml
  def show
    @rating = @wine.ratings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = @wine.ratings.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = @wine.ratings.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = @wine.ratings.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to([@wine, @rating], :notice => 'Rating was successfully created.') }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = @wine.ratings.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to([@wine, @rating], :notice => 'Rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = @wine.ratings.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(wine_ratings_url) }
      format.xml  { head :ok }
    end
  end

private

  def find_wine
    @wine = Wine.find(params[:wine_id])
  end

end
