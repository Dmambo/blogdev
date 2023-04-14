class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(author: @user, post: @post)

    respond_to do |_format|
      if @like.save
        flash[:success] = 'Liked'
      else
        flash.now[:error] = 'Error While Like'
      end
      redirect_to user_post_path(@post.author, @post)
    end
  end
end
