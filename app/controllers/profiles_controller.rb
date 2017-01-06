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
    jsonify[:posts] = user.received_posts
    jsonify[:friends] = user.all_friends

    display << jsonify
    render json: display
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
    user = User.find_by(full_name: params[:query])

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
