class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts.includes(:comments, :likes)
  end

  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @comments = @post.comments.includes(:author)
    @likes = @post.likes.includes(:author)
    @comment = Comment.new
  end

  def new
    @users = User.find(params[:user_id])
    @post = @users.posts.build
  end

  def create
    @users = User.find(params[:user_id])
    @post = @users.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@users, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
