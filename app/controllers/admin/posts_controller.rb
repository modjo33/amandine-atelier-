class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: %i[edit update destroy]
  layout "admin"

  def index
    @posts = Post.order(position: :asc, created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: "Post cr&eacute;&eacute; avec succ&egrave;s."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Post mis &agrave; jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: "Post supprim&eacute;."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :instagram_url, :post_type, :position, :active, :published_at, :photo)
  end
end
