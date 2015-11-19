class BookmarkersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @bookmarker = Bookmarker.where(:user_id => current_user.id)
  end

  def create
    @bookmarker = Bookmarker.new
    @bookmarker.user_id = current_user.id
    @bookmarker.interest_id = params[:interest_id]
    if @bookmarker.save
      redirect_to :back
    else
      redirect_to :back, status: 500
    end
  end

  def show
    @bookmarker = Bookmarker.where(:user_id => current_user.id).where(:interest_id => params[:interest_id])
  end

  def destroy
    @bookmarker = Bookmarker.where(:user_id => current_user.id).where(:interest_id => params[:interest_id])
    Bookmarker.delete(@bookmarker)
    redirect_to :back, status: 200
  end

end
