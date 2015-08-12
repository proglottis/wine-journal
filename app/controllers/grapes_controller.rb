class GrapesController < ApplicationController
  def index
    @grapes = Wine.tag_counts_on(:grapes).order('name asc')
  end

  def show
    @grape = Wine.tag_counts_on(:grapes).where(:id => params[:id]).first
    @wines = Wine.tagged_with(@grape.name, :on => :grapes).order('created_at desc')
  end

end
