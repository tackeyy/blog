class PostDecorator < Draper::Decorator
  delegate_all

  REDCARPET_OPTIONS = {
    hard_wrap:       true,
    link_attributes: { rel: 'nofollow', target: '_blank' }
  }.freeze

  REDCARPET_EXTENSIONS = {
    filter_html:     true,
    autolink:           true,
    superscript:        true,
    tables:             true
  }.freeze

  def to_html
    # NOTE: Shallow Copyしないと怒られる -> ` Can't modify frozen hash `
    renderer = Redcarpet::Render::OriginalHTML.new(REDCARPET_OPTIONS.dup)
    markdown = Redcarpet::Markdown.new(renderer, REDCARPET_EXTENSIONS)

    markdown.render(model.body).html_safe
  end
end
