# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.url
SitemapGenerator::Interpreter.send :include, ApplicationHelper

SitemapGenerator::Sitemap.create do
  add root_path
  add blog_categories_path
  add blog_tags_path

  Post.shipped.each do |post|
    add blog_friendly_path(post), lastmod: post.updated_at
  end

  Post.tag_counts_on(:categories).each do |category|
    add blog_category_path(category.name)
  end

  Post.tag_counts_on(:tags).each do |tag|
    add blog_tag_path(tag.name)
  end
end
