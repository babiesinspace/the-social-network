class ProfilesController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    display = []
    jsonify = {}
    user = User.find(params[:id])
    jsonify[:user_info] = user
    jsonify[:posts] = user.received_posts
    jsonify[:friends] = user.all_friends

    display << jsonify
    render json: display
  end

end
