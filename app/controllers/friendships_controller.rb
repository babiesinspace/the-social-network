class FriendshipsController < ApplicationController

  def index
    user = User.find(params[:profile_id])
    user_friends = user.all_friends
    respond_to do |format|
      format.html
      format.json { render json: user_friends }
    end
  end

  def create
    request = FriendRequest.find(params[:request_id])
    friendship = Friendship.new(friendship_params)
    if friendship.save && request.destroy
      flash[:notice] = "You have a new friend!"
    else
      flash[:error] = "There was a problem with your request!"
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to root_url
  end

  private
    def friendship_params
      params.require(:friendship).permits(:user_1_id, :user_2_id)
    end
end
