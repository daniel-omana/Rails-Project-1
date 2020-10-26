class Book < ApplicationRecord
  belongs_to :publisher

  vallidats :title, :isbn, :isbn13, :number_of_pages, :rating, presence: true
  validates :title, uniqueness: true
  validates :isbn, :isbn13, :number_of_pages, numericality: { only_integer: true }
  validates :rating, numericality: true
end
