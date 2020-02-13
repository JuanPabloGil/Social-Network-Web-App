class FriendshipsController < ApplicationController
  def create
    @friend = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
    if @friend.save
      redirect_to root_path, notice: 'Request send'
    else
      redirect_to root_path, alert: 'Error on sending request'
    end
  end

  def destroy
    frnd = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    if frnd
      frnd.destroy
      redirect_to root_path, notice: 'Friend Deleted'
    else
      redirect_to rooth_path, alert: 'You cannot Delete this friend '
    end
  end
end