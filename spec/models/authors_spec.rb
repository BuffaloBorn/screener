require 'rails_helper'

RSpec.describe 'Authors' do
  context 'validations' do
    describe '#name' do
      context 'not present' do
        let(:name) { nil }

        it 'is invalid' do
          author = Author.new(name: name)
          expect(author.valid?).to be_falsey
          expect(author.errors.keys).to include(:name)
        end
      end

      context 'over 255 characters' do
        let(:name) { 'x'*256 }

        it 'is invalid' do
          author = Author.new(name: name)
          expect(author.valid?).to be_falsey
          expect(author.errors.keys).to include(:name)
        end
      end
    end
  end
end
