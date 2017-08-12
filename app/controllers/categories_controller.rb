class CategoriesController < ApplicationController
  before_action :set_categories

  def index
    @tags = Post.tag_counts_on(:tags).decorate
  end

  def show
    @category_name = params[:id]
    @posts         = Post.tagged_with(params[:id], on: :categories).page(params[:page]).decorate
    @latest_posts  = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
    @tags          = Post.tag_counts_on(:tags).decorate
  end

  private

  def set_categories
    @categories = Post.tag_counts_on(:categories).decorate
  end
end
