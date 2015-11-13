class BookmarkersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @bookmarker = Bookmarker.new
    @bookmarker.user_id = current_user.id
    @bookmarker.interest_id = params[:id]
    if @bookmarker.save
      redirect_to :back
    else
      redirect_to :back, status: 500
    end
  end

  def show
    @bookmarker = Bookmarker.where(:user_id => current_user.id)
  end
end
