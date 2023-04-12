class PostsController < ApplicationController
  def index
    @users = User.find(params[:id])
    @posts = @users.posts.includes(:comments, :likes)
  end

  def show
    @users = User.find(params[:id])
    @post = Post.find(params[:id_post])
    @comments = @post.comments.includes(:author)
    @likes = @post.likes.includes(:author)
  end
end
