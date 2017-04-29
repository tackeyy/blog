# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.url

SitemapGenerator::Sitemap.create do
  add root_path
  add categories_path
  Post.shipped.each do |post|
    add blog_path(post.friendly_id || post.id), lastmod: post.updated_at
  end
end
