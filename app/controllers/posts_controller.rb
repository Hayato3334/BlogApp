class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @q = Post.all.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    redirect_to(posts_path) if current_user.nil?
    @post = Post.new
  end

  def confirm_new
    @post = current_user.posts.new(post_params)
    render :new unless @post.valid?
  end

  def create
    @post = current_user.posts.new(post_params)

    if params[:back].present?
      render :new
      return
    end

    if @post.save
      redirect_to @post, notice: "記事「#{@post.title}」を投稿しました。"
    else
      render :new
    end
  end

  def edit
  end

  def confirm_edit
    @post = current_user.posts.find(params[:id])
    @post.update!(post_params)
    render :edit unless @post.valid?
  end

  def update
    post = Post.find(params[:id])

    if params[:back].present?
      render :edit
      return
    end

    post.update!(post_params)
    redirect_to posts_url, notice: "記事「#{post.title}」を更新しました。"
  end

  def destroy
    # post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: "記事「#{@post.title}」を削除しました。"
  end

    private
      def post_params
        params.require(:post).permit(:title, :body, :image, :image_cache)
      end

      def correct_user
        @post = Post.find(params[:id])
        redirect_to(posts_path) unless current_user.id == User.find_by(id: @post.user_id).id
      end
end
