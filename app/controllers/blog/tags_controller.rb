class Blog::TagsController < ApplicationController
  before_action :set_tags
  before_action :set_categories

  def index
  end

  def show
    @tag_name     = params[:id]
    @posts        = Post.tagged_with(params[:id], on: :tags).page(params[:page]).decorate
    @latest_posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
  end

  private

  def set_tags
    @tags = Post.tag_counts_on(:tags).decorate
  end

  def set_categories
    @categories = Post.tag_counts_on(:categories).decorate
  end
end
