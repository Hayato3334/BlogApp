class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @p = @user.posts.page(params[:page])
  end
end
