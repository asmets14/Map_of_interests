class InterestsController < ApplicationController
  def index
    @category = ["theatre", "club", "museum", "restaurant" ,"bar","cafe"]
    @interest = Interest.all
  end

  def show
    @category = ["theatre", "club", "museum", "restaurant" ,"bar","cafe"]
    if !(params[:tag].nil?)
      @interest = Interest.tagged_with(params[:tag], :any => true)
    elsif !(params[:category].nil?)
      if params[:category] == 'all'
        @interest = Interest.published
      else
        category_title = params[:category].split(',')
        category_title.each do | c |
           @interest = Interest.where(category: c.capitalize)
        end
      end
    end
  end

  def create
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def fullscreen
    @category = ["theatre", "club", "museum", "restaurant" ,"bar","cafe"]
    @interest = Interest.all
  end
end
