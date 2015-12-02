class PointOfInterestsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"
  before_filter :initialize_category

  def index
    if !(params[:tag].nil?)
      @PointOfInterests = PointOfInterest.tagged_with(params[:tag], :any => true)
    elsif !(params[:category_id].nil?)
      if params[:category_id] == 'all'
        @PointOfInterests = PointOfInterest.published
      else
        category_title = params[:category_id].split(',')
        category_title.each do | c |
          @PointOfInterests = PointOfInterest.where(category_id: c)
        end
      end
    end
  end

  def fullscreen
    @PointOfInterests = PointOfInterest.all
  end

  private

  def initialize_category
    @category = Category.where(:published => true).map(&:decorate)
  end
end

