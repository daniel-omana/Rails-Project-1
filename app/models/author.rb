class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates :name, presence: true, uniqueness: true

  def self.ordered_by_books
    self.select('authors.*')
        .select('COUNT(authors.id) as book_count')
        .left_joins(:books)
        .group('authors.id')
        .order('book_count DESC')
  end
end
