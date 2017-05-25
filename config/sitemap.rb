# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.url

SitemapGenerator::Sitemap.create do
  add root_path
  add categories_path
  add tags_path

  Post.shipped.each do |post|
    add blog_path(post.friendly_id || post.id), lastmod: post.updated_at
  end

  Post.tag_counts_on(:categories).each do |category|
    add category_path(category.name)
  end

  Post.tag_counts_on(:tags).each do |tag|
    add tag_path(tag.name)
  end
end
