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
        author = Author.create(name: 'first author')
        book = Book.create(title: "Test Title", author_id: author.id)
        get :index
        author_created_at = Time.parse(author.created_at.to_s).iso8601
        author_updated_at = Time.parse(author.updated_at.to_s).iso8601
        body = JSON.parse(response.body)
        expect(response.code).to eq("200")
        expect(body).to eq([{ "author_id"=> book.author_id,"id" => book.id, "title" => book.title, "author"=>{ "created_at"=> author_created_at, "id"=>author.id, "name" => author.name, "updated_at"=> author_updated_at} }]
        )
      end
    end
  end
end
