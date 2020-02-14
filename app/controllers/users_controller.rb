class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friends = @user.friends
  end

  def notify
    @user = current_user
    @requests = @user.friend_requests
    if @requests.size >= 1
      @requests
    else
      'You dont have notifications'
    end
  end
end
