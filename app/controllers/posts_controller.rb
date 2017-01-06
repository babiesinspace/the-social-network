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

#Untested (must first create form)
  def create
    author = current_user
    receiver = User.find(params[:profile_id])
    post = Post.new(post_params)
    if post.save
      respond_to do |format|
        format.html { redirect_to profile_url(receiver) }
        format.json { render json: post }
      end
    else
      flash[:error] = "There was a problem creating your post!"
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permits(:body, :author_id, :receiver_id)
  end

end
