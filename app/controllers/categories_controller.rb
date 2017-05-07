class CategoriesController < ApplicationController
  def index
    @categories = Post.tag_counts_on(:categories).decorate
    @tags = Post.tag_counts_on(:tags).decorate
  end

  def show
    @category_name = params[:id]
    @posts = Post.tagged_with(params[:id], on: :categories).page(params[:page]).decorate
    @categories = Post.tag_counts_on(:categories).decorate
    @tags = Post.tag_counts_on(:tags).decorate
  end
end
