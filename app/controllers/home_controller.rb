class HomeController < ApplicationController
  def index
    @posts = Post.shipped.order(created_at: :desc).limit(Post::LATEST_POSTS_COUNT).decorate
  end
end
