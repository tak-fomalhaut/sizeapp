class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @name = current_user.name
    @posts = current_user.posts.page(params[:page]).per(20).order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
