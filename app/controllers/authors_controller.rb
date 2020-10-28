class AuthorsController < ApplicationController
  def index
    @authors = Author.ordered_by_books.page params[:page]
  end

  def show
    @author = Author.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keyword]}%"
    @authors = Author.where('title LIKE ?', wildcard_search)
  end
end
