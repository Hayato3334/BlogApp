class LikesController < ApplicationController
  before_action :user_signed_in?

  def create
    @like = current_user.likes.create!(post_id: params[:post_id])
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @post = Post.find_by(id: params[:id])
    @like.destroy
  end
end
