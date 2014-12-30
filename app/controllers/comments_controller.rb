class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @anecdote = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(anecdote_params)
    redirect_to posts_path
  end

  def anecdote_params
    params.require(:comment).permit(:username, :comments)
  end

end
