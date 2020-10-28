# README

Datasets used:
books.csv - Kaggle.com
FAKER GEM - https://github.com/faker-ruby/faker
Nba Player Data Set - https://nba-players.herokuapp.com/

Books.csv will be used as the primary source of data to complete the publishers, books, authors, and author_books table.
FAKER and the NBA data set will primarily be used to to create users, provide an image, assign emails and coordinates.

Relationships:
Data is going to be structured in a way that Book has one Publisher, but Publisher has many books.
Books may have many authors, and Authors may have many books.
Books may have many Users, and Users may have many books. In this case Users may have many "Favourite Books"

Publisher
PublisherID: int
Name: String

Book
BookID:       int
AuthorID:     int
PublisherID:  int
title:        string
isbn:         int
isbn13:       int
rating:       decimal

Author
AuthorID: int
Name:     string

User
UserID:  int
Name:    string
email:   string
adress:  string
picture: string

FavouriteBook
BookID: int
UserID: int

BookAuthor
BookID:   int
AuthorID: int