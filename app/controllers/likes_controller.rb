class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @post.reload
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @like.destroy
    @post.reload
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

end
