class Publisher < ApplicationRecord
  has_many :books

  validates :name, presence: true, uniqueness: true

  paginates_per 10

  def self.ordered_by_books
    self.select('publishers.*')
        .select('COUNT(publishers.id) as book_count')
        .left_joins(:books)
        .group('publishers.id')
        .order('book_count DESC')
  end
end
