class RanksController < ApplicationController
  def index
    @ranks = Rank.all
  end

  def show
    @rank = Rank.find(params[:id])
  end
end
