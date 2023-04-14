class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post: @post)
    redirect_to @post
  end
end
