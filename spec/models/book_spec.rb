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
    end

    describe '#author' do
      context 'not present' do
        let(:author) { nil }

        it 'is invalid' do
          book = Book.new(author: author)
          expect(book.valid?).to be_falsey
          expect(book.errors.keys).to include(:author)
        end
      end

      context 'over 255 characters' do
        let(:author) { 'x'*256 }

        it 'is invalid' do
          book = Book.new(author: author)
          expect(book.valid?).to be_falsey
          expect(book.errors.keys).to include(:author)
        end
      end
    end

    context 'author and title are valid' do
      let(:author) { 'x'*255 }
      let(:title) { 'x'*255 }

      it 'is valid' do
        book = Book.new(author: author, title: title)
        expect(book.valid?).to be_truthy
      end
    end
  end
end
