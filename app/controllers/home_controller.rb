class HomeController < ApplicationController
  def index
    @ratings = Rating.order("created_at DESC")
  end

end
