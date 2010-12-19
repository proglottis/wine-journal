class GrapesController < ApplicationController

  def index
    @grapes = Wine.select('grape').group('grape').order('grape asc').count
  end

  def show
    params[:id] = CGI.unescape(params[:id])
    if params[:id] == 'Unknown' then
      grape = ''
    else
      grape = params[:id]
    end
    @wines = Wine.where(:grape => grape).order('created_at desc')
  end

end
