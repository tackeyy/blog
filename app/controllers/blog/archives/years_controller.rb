class Blog::Archives::YearsController < Blog::Archives::ArchivesController
  def index
    render template: 'blog/archives/index'
  end
end
