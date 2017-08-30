class PostDecorator < Draper::Decorator
  delegate_all

  REDCARPET_OPTIONS = {
    hard_wrap:       true,
    link_attributes: { rel: 'nofollow', target: '_blank' }
  }.freeze

  REDCARPET_EXTENSIONS = {
    filter_html:        true,
    autolink:           true,
    superscript:        true,
    fenced_code_blocks: true,
    tables:             true
  }.freeze

  def to_html
    # NOTE: Shallow Copyしないと怒られる -> ` Can't modify frozen hash `
    renderer = Redcarpet::Render::OriginalHTML.new(REDCARPET_OPTIONS.dup)
    markdown = Redcarpet::Markdown.new(renderer, REDCARPET_EXTENSIONS)

    markdown.render(model.body).html_safe
  end

  def link_to_tag_lists
    model.tag_list.map do |tag|
      h.link_to("##{tag}", h.blog_tag_path(tag))
    end.join("&nbsp;").html_safe
  end
end
