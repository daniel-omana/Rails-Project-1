class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order('rating DESC')
  end

  def show
    @book = Book.find(params[:id])
  end
end
