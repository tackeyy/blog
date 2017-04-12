class BlogController < ApplicationController
  before_action :set_post

  def show
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id]).decorate || Post.find(params[:id]).decorate
  end
end
