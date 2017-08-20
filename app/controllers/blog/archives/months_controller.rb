class Blog::Archives::MonthsController < Blog::Archives::ArchivesController
  def index
    render template: 'blog/archives/index'
  end
end
