class HomesController < ApplicationController
  def show
    @ratings = Rating.order("created_at DESC")
  end

end
