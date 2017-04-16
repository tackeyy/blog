class ActsAsTaggableOn::TagDecorator < Draper::Decorator
  include ActionView::Helpers::UrlHelper
  delegate_all

  def render_category_link
    link_to("#{model.name} (#{model.taggings_count})", h.category_path(model.name))
  end
end
