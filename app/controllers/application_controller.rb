class ApplicationController < ActionController::Base
  helper_method :cms_pages

  def cms_pages
    Pages.all
  end
end
