class ProfilesController < ApplicationController
  before_action :is_friend?, only: [:show]
  before_action :authorized_to_edit?, only: [:edit, :update]

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
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @user }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(profile_params)
      redirect_to profile_url(@user)
    else
      render 'edit'
    end
  end

  def search
    user = User.ransack(full_name_cont: params[:query])
    results = user.result
    render json: results
  end

  private

    def profile_params
      params.require(:user).permits(:full_name, :birthday, :hometown, :current_city, :education, :relationship_status, :query)
    end

    def is_friend?
      redirect_to(root_url) unless (current_user.all_friends.include?(User.find(params[:id])) || current_user == User.find(params[:id]))
    end

    def authorized_to_edit?
      redirect_to(root_url) unless (current_user == User.find(params[:id]))
    end

end
