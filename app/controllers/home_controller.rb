class HomeController < ApplicationController
  def index
    posts       = Post.shipped.order(created_at: :desc)
    @posts      = posts.page(params[:page]).decorate
    @archives   = Post.archive_list(posts: posts)
    @categories = Post.tag_counts_on(:categories).decorate
    @tags       = Post.tag_counts_on(:tags).decorate
  end
end
