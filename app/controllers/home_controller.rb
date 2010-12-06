class HomeController < ApplicationController
  def index
    @ratings = Rating.order("created_at ASC")
  end

end
