class RatingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_wine

  # POST /ratings
  # POST /ratings.xml
  def create
#    params[:rating][:rank] = Rank.find(params[:rating][:rank])
    @rating = @wine.ratings.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to(@wine, :notice => 'Rating was successfully created.') }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = @wine.ratings.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(wine_url) }
      format.xml  { head :ok }
    end
  end

private

  def find_wine
    @wine = Wine.find(params[:wine_id])
  end

end
