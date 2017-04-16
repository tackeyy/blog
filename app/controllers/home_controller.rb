class HomeController < ApplicationController
  def index
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
    @categories = Post.tag_counts_on(:categories).decorate
    @tags = Post.tag_counts_on(:tags).decorate
  end
end
