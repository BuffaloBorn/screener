class BooksController < ApplicationController
  def index
    books = Book.all
    render  json: books.as_json(include: :author, only: [:name])
  end
end
