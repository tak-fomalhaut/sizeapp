class Posts::SearchesController < ApplicationController
  def index
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(20)
  end
end
