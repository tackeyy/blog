class HomeController < ApplicationController
  def index
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
  end
end
