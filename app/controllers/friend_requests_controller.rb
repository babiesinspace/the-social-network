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

end

def destroy

end

end
