class RatingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_wine

  def create
    @rating = @wine.ratings.new(rating_params)

    if @rating.save
      redirect_to(wine_url(@wine), :notice => 'Rating was successfully created.') }
    else
      render :action => "new"
    end
  end

  def destroy
    @rating = @wine.ratings.find(params[:id])
    @rating.destroy

    redirect_to(wine_url(@wine))
  end

private

  def find_wine
    @wine = Wine.find(params[:wine_id])
  end

  def rating_params
    params.require(:rating).permit(:cost, :special, :rank_id, user_ids: [])
  end

end
