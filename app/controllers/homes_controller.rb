class HomesController < ApplicationController
  def show
    @ratings = Rating.order("created_at DESC").paginate(:page => params[:page])
  end
end
