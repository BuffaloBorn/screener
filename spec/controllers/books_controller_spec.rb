require 'rails_helper'

RSpec.describe BooksController do
  describe 'GET #index' do
    context 'no books' do
      it 'returns an empty array' do
        get :index

        expect(response.code).to eq("200")
        expect(response.body).to eq("[]")
      end
    end

    context 'books' do
      it 'returns the found books' do
        book = Book.create(title: "Test Title", author: "Test Author")
        get :index

        body = JSON.parse(response.body)

        expect(response.code).to eq("200")
        expect(body).to eq([{ "author" => book.author, "id" => book.id, "title" => book.title }])
      end
    end
  end
end
