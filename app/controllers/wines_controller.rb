class WinesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  autocomplete :wine, :producer
  autocomplete :wine, :region

  # GET /wines
  # GET /wines.xml
  def index
    @wine = Wine.new
    @wines = Wine.order("created_at desc").paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wines }
    end
  end

  # GET /wines/1
  # GET /wines/1.xml
  def show
    @wine = Wine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wine }
    end
  end

  # GET /wines/1/edit
  def edit
    @wine = Wine.find(params[:id])
  end

  # POST /wines
  # POST /wines.xml
  def create
    @wine = Wine.new(wine_params)
    @wines = Wine.order("created_at desc").paginate(:page => params[:page])

    respond_to do |format|
      if @wine.save
        format.html { redirect_to(@wine, :notice => 'Wine was successfully created.') }
        format.xml  { render :xml => @wine, :status => :created, :location => @wine }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wines/1
  # PUT /wines/1.xml
  def update
    @wine = Wine.find(params[:id])

    respond_to do |format|
      if @wine.update_attributes(wine_params)
        format.html { redirect_to(@wine, :notice => 'Wine was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.xml
  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to(wines_url) }
      format.xml  { head :ok }
    end
  end

  def autocomplete_wine_grape_list
    method = :name
    term = params[:term]

    if term && !term.empty?
      items = Wine.tag_counts_on(:grapes).where(["LOWER(tags.#{method}) LIKE ?", "#{term.downcase}%"]) \
        .limit(10).order("#{method} ASC")
    else
      items = {}
    end
    render :json => json_for_autocomplete(items, method)
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :year, :producer, :alcohol, :region, :grape_list)
  end
end
