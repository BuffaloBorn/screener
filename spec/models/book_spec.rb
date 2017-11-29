require 'rails_helper'

RSpec.describe 'Book' do
  context 'validations' do
    describe '#title' do
      context 'not present' do
        let(:title) { nil }

        it 'is invalid' do
          book = Book.new(title: title)
          expect(book.valid?).to be_falsey
          expect(book.errors.keys).to include(:title)
        end
      end

      context 'over 255 characters' do
        let(:title) { 'x'*256 }

        it 'is invalid' do
          book = Book.new(title: title)
          expect(book.valid?).to be_falsey
          expect(book.errors.keys).to include(:title)
        end
      end

      context 'under 255 characters with author_id is null' do
        let(:title) { 'x'*254 }
        let(:author_id) { nil }

        it 'is invalid' do
          book = Book.new(title: title, authors_id: author_id)
          expect(book.valid?).to be_truthy
        end
      end

      context 'under 255 characters with valid author_id' do
        let(:title) { 'x'*254 }

        it 'is invalid' do
          author = Author.create(f_name: 'f_name1', l_name: 'l_name1')
          author_id = author.id
          book = Book.new(title: title, authors_id: author_id)
          expect(book.valid?).to be_truthy
        end
      end
    end
  end
end
