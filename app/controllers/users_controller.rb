class UsersController < ApplicationController
  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @q = @user.posts.ransack(params[:q])
    @p = @q.result(distinct: true).page(params[:page])
  end
end
