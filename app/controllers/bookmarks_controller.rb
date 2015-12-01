class BookmarksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @bookmark = Bookmark.where(:user_id => current_user.id)
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user_id = current_user.id
    @bookmark.interest_id = params[:interest_id]
    if @bookmark.save
      redirect_to :back
    else
      redirect_to :back, status: 500
    end
  end

  def show
    @bookmark = Bookmark.where(:user_id => current_user.id).where(:interest_id => params[:interest_id])
  end

  def destroy
    @bookmark = Bookmark.where(:user_id => current_user.id).where(:interest_id => params[:interest_id])
    Bookmark.delete(@bookmarker)
    redirect_to :back, status: 200
  end

end
