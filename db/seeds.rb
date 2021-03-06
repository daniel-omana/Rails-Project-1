require 'faker'
require 'csv'

AuthorBook.delete_all
FavouriteBook.delete_all
User.delete_all
Author.delete_all
Book.delete_all
Publisher.delete_all
Page.delete_all

Page.create(
  title: 'About US',
  content: 'BLAH BLAH BLAH BLAH BLAH BLAH',
  permalink: 'about_us'
)

csv_data = File.read(Rails.root.join('db/books.csv'))
books = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

books.each do |b|
  publisher = Publisher.find_or_create_by(name: b['publisher'])

  if publisher&.valid?
    # create the books
    book = publisher.books.create(
      title: b['title'],
      isbn: b['isbn'],
      isbn13: b['isbn13'],
      number_of_pages: b['num_pages'],
      rating: b['average_rating']
    )
    unless book&.valid?
      puts "Invalid book #{b['title']}"
      next
    end

    authors = b['authors'].split('/').map(&:strip)
    authors.each do |author_name|
      author = Author.find_or_create_by(name: author_name)
      AuthorBook.create(book: book, author: author)
    end

  else
    puts "Invalid publisher #{m['publisher']} for book #{b['title']}"
  end
end

20.times do
  player_name = Faker::Sports::Basketball.unique.player
  first_name = player_name.split(' ')[0]
  last_name = player_name.split(' ')[1]

  User.create(
    name: player_name,
    address: "#{Faker::Address.unique.longitude}, #{Faker::Address.unique.latitude}",
    email: Faker::Internet.unique.email,
    picture: "https://nba-players.herokuapp.com/players/#{last_name}/#{first_name}"
  )
end

User.all.each do |user|
  rand(1..10).times do
    fav_book = Book.order('RANDOM()').first
    FavouriteBook.create(user: user, book: fav_book)
  end
end

puts "Created #{Publisher.count} publishers"
puts "Created #{Book.count} books"
puts "Created #{Author.count} authors"
puts "Created #{AuthorBook.count} Book Authors"

User.all.each do |user|
  puts user.name
  puts user.address
  puts user.email
  puts user.picture
  puts user.books.map(&:title)
  puts
end
