class BooksController < ApplicationController
  def index
    books = Book.all
    render :json => books.to_json(except: [:authors_id], :include => :author)
  end
end
