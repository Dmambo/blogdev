class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @current_user.comments.new(params)
    @comment.post_id = params[:post_id]
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
