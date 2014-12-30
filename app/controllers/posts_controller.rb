class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:username, :comment, :image)
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user && @post.username == current_user.username
       @post.destroy
    else
    end
    redirect_to '/posts'
  end

end