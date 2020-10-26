class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher)
                 .order('rating DESC')
                 .limit(10)

    @publishers = Publisher.ordered_by_books
                           .limit(10)
  end
end
