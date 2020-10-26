class PublishersController < ApplicationController
  def index
    @publishers = Publisher.ordered_by_books

    # SELECT COUNT(publishers.id) as book_count, publishers.id, publishers.name
    # FROM publishers
    # LEFT OUTER JOIN books
    # 	ON books.publisher_id = publishers.id
    # GROUP BY publishers.id
    # ORDER BY book_count;
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
