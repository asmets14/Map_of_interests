class CategoriesController < ApplicationController

  def index
    @categories = Category.where(:published => true)
  end
end
