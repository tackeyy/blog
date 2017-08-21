class Blog::Archives::MonthsController < Blog::Archives::ArchivesController
  before_action :set_posts,      only: :index
  before_action :set_archives,   only: :index
  before_action :set_categories, only: :index
  before_action :set_tags,       only: :index

  def index
    render template: 'blog/archives/index'
  end

  private

  def set_posts
    from   = Date.new(params[:year].to_i, params[:month].to_i, 1)
    @posts = Post.shipped.where(created_at: from..from.end_of_month).order(created_at: :desc).page(params[:page]).decorate
  end

  def set_archives
    super
  end

  def set_categories
    super
  end

  def set_tags
    super
  end
end
