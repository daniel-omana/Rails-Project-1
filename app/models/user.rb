class User < ApplicationRecord
  has_many :favourite_books
  has_many :books, through: :favourite_books

  validates :name, :address, :email, presence: true
end
