class BlogController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
    @categories = Post.tag_counts_on(:categories).decorate
    @tags = Post.tag_counts_on(:tags).decorate
  end

  def show
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id]).decorate || Post.find(params[:id]).decorate
  end
end
