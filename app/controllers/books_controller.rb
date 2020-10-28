class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order('rating DESC').page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keyword]}%"
    @books = Book.where('title LIKE ?', wildcard_search)
  end
end
