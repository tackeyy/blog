class TagsController < ApplicationController
  def show
    @tag_name = params[:id]
    @posts = Post.tagged_with(params[:id]).page(params[:page]).decorate
    @categories = Post.tag_counts_on(:categories).decorate
    @tags = Post.tag_counts_on(:tags).decorate
  end
end
