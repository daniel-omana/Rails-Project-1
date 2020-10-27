class Book < ApplicationRecord
  belongs_to :publisher
  has_many :author_books
  has_many :authors, through: :author_books

  validates :title, :isbn, :isbn13, :number_of_pages, :rating, presence: true
  validates :title, uniqueness: true
  validates :isbn, :isbn13, :number_of_pages, numericality: { only_integer: true }
  validates :rating, numericality: true
end
