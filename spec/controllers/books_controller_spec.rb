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
        author = Author.create(f_name: 'f_name1', l_name: 'l_name1')
        puts "author -> #{author.to_json}"
        book = Book.create(title: "Test Title", authors_id: author.id)
        puts "book -> #{book.to_json}"
        get :index

        body = JSON.parse(response.body)
        puts "body -> #{body}"
        expect(response.code).to eq("200")
        expect(body).to eq([{ "name" => book.author.name, "id" => book.id, "title" => book.title }])
      end
    end
  end
end
