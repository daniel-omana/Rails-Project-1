class BookAuthor < ApplicationRecord
  belongs_to :Author
  belongs_to :Book
end
