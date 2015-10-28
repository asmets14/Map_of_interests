class InterestsController < ApplicationController
  def index
    @category = ["Theatre", "Club", "Museum", "Restaurant" ,"Bar","Cafe"]
    @interest = Interest.all
  end

  def show
    @category = ["Theatre", "Club", "Museum", "Restaurant" ,"Bar","Cafe"]
    if params[:category] == 'all'
      @interest = Interest.all
    else
      @interest = Interest.where(category: params[:category].capitalize)
    end
  end

  def create
    @test = 'lol'
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def fullscreen
    @category = ["Theatre", "Club", "Museum", "Restaurant" ,"Bar","Cafe"]
    @interest = Interest.all
  end
end
