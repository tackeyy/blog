class FeedController < ApplicationController
  def index
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
