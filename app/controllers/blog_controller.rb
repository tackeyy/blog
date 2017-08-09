class BlogController < ApplicationController
  before_action :set_posts, only: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @categories = Post.tag_counts_on(:categories).decorate
    @tags       = Post.tag_counts_on(:tags).decorate
  end

  def show
    @categories = Post.tag_counts_on(:categories).decorate
    @tags       = Post.tag_counts_on(:tags).decorate
  end

  private

  def set_posts
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
  end

  def set_post
    @post = Post.friendly.find(params[:id]).decorate || Post.find(params[:id]).decorate
  end
end
