class Blog::Archives::ArchivesController < ApplicationController
  private

  def set_archives
    @archives = Post.all_archive_list
  end

  def set_categories
    @categories = Post.tag_counts_on(:categories).decorate
  end

  def set_tags
    @tags = Post.tag_counts_on(:tags).decorate
  end
end
