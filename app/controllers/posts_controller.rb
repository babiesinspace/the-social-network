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

#Untested (must first create form)
  def destroy
    post = Post.find(params[:id])
    if current_user == post.author || current_user == post.receiver
      post.destroy
      respond_to do |format|
        format.html { redirect_to profile_url(post.receiver) }
      end
    else
      flash[:error] = "You are not authorized to affect this post!"
    end
  end

  private

  def post_params
    params.require(:post).permits(:body, :author_id, :receiver_id)
  end

end
