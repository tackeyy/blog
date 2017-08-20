module ApplicationHelper
  def default_meta_tags
    {
      site:        Settings.title,
      reverse:     true,
      title:       Settings.title,
      description: Settings.description,
      keywords:    Settings.keywords,
      canonical:   request.original_url
    }
  end

  def blog_friendly_path(post)
    blog_post_path(post.friendly_id || post.id)
  end
end
