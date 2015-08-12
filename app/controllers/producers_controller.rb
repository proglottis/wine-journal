class ProducersController < ApplicationController
  def index
    @producers = Wine.select('producer').group('producer').order('producer asc').count
  end

  def show
    params[:id] = CGI.unescape(params[:id])
    if params[:id] == 'Unknown' then
      producer = ''
    else
      producer = params[:id]
    end
    @wines = Wine.where(:producer => producer).order('created_at desc')
  end
end
