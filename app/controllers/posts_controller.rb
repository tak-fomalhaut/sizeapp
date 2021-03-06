class PostsController < ApplicationController
  # before_action :move_to_index,except: [:index]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def fromlike
    @post = Post.find(params[:id])
  end

  def forlike
    user = User.find(params[:id])
    @user = user
    @posts = user.posts.page(params[:page]).per(20).order("created_at DESC")
  end

  # def gon
  #   gon.image = @post.image
  # end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
