class Blog::Archives::ArchivesController < ApplicationController
  before_action :set_posts,      only: :index
  before_action :set_archives,   only: :index
  before_action :set_categories, only: :index
  before_action :set_tags, only: :index

  private

  def set_posts
    @posts = Post.shipped.order(created_at: :desc).page(params[:page]).decorate
  end

  def set_archives
    @archives = Post.archive_list(posts: @posts)
  end

  def set_categories
    @categories = Post.tag_counts_on(:categories).decorate
  end

  def set_tags
    @tags = Post.tag_counts_on(:tags).decorate
  end
end
