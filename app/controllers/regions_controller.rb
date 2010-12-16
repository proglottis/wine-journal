class RegionsController < ApplicationController

  def index
    @regions = Wine.select('region').group('region').order('region asc').count
  end

  def show
    if params[:id] == 'Unknown' then
      region = ''
    else
      region = params[:id]
    end
    @wines = Wine.where(:region => region).order('created_at desc')
  end

end
