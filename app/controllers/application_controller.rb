require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :set_archives

  private

  def set_archives
    @archives = Post.all_archive_list
  end
end
