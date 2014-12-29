class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @commment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to posts_path
  end

  def review_params
    params.require(:comment).permit(:comments)
  end

end
