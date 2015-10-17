class InterestsController < ApplicationController
  def index
    @interest = Interest.all
  end

  def show
    if params[:category] == 'All'
      @interest = Interest.all
    else
      @interest = Interest.where(category: params[:category].capitalize)
    end
    data = {:message => @interest}
    render :json => data, :status => :ok
  end
end
