class ProfilesController < ApplicationController
  def index
    users = User.all
    respond_to do |format|
      format.html
      format.json { render json: users }
    end
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

  def edit
    user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: user }
    end
  end

end
