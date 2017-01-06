class PostsController < ApplicationController
  # before_action: :authenticate_user!

  def index
    user = User.find(params[:profile_id])
    posts = user.received_posts
    respond_to do |format|
      format.html
      format.json { render json: posts }
    end
  end

  def create

  end

  def destroy

  end

end
