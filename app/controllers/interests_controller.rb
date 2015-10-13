class InterestsController < ApplicationController
  def index
    @interest = Interest.all
  end
end
