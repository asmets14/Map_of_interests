class InterestsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"
  before_filter :initialize_category

  def index
    @interest = Interest.all
  end

  def show
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

  def fullscreen
    @interest = Interest.all
  end

  private

  def initialize_category
    @category = ["Theatre", "Club", "Museum", "Restaurant" ,"Bar","Cafe"]
  end
end

