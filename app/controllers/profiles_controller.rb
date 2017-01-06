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
    json_posts = user.received_posts.inject([]) { |memo, post| memo <<  {author_id: post.author_id, author_name: post.author.full_name, body: post.body }}
    jsonify[:posts] = json_posts
    jsonify[:friends] = user.all_friends

    display << jsonify

    respond_to do |format|
      format.html
      format.json {render json: display}
    end
  end

  def edit
    user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: user }
    end
  end

end
