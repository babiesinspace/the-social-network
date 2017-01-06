class FriendRequestsController < ApplicationController
  # before_action: :authenticate_user!

  def index
    user = User.find(params[:profile_id])
    pending_requests = {}
    pending_requests[:sent_requests] = user.sent_requests
    pending_requests[:received_requests] = user.received_requests
    respond_to do |format|
      format.html
      format.json { render json: pending_requests }
    end
  end

  def create
    sender = current_user
    receiver = User.find(params[:profile_id])
    request = FriendRequest.new(friend_requests_params)
    if request.save
      flash[:notice] = "Request Sent!"
    else
      flash[:error] = "There was a problem creating your post!"
    end
  end

  def destroy

  end

  private

  def friend_requests_params
    params.require(:friend_request).permits(:requester_id, :receiver_id)
  end

end
