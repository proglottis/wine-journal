class WinesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  autocomplete :wine, :producer
  autocomplete :wine, :region

  def index
    @wine = Wine.new
    @wines = Wine.order("created_at desc").paginate(:page => params[:page])
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def create
    @wine = Wine.new(wine_params)
    @wines = Wine.order("created_at desc").paginate(:page => params[:page])

    if @wine.save
      redirect_to(wine_url(@wine), :notice => 'Wine was successfully created.')
    else
      render :action => "index"
    end
  end

  def update
    @wine = Wine.find(params[:id])

    if @wine.update_attributes(wine_params)
      redirect_to(wine_url(@wine), :notice => 'Wine was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    redirect_to(wines_url)
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
