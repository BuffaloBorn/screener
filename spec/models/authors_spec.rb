require 'rails_helper'

RSpec.describe 'Authors' do
  context 'validations' do
    describe '#f_name and l_name' do
      context 'not present' do
        let(:f_name) { nil }
        let(:l_name) { nil }

        it 'is invalid' do
          author = Author.new(f_name: f_name, l_name: l_name)
          expect(author.valid?).to be_falsey
          expect(author.errors.keys).to include(:f_name, :l_name)
        end
      end

      context 'over 255 characters' do
        let(:f_name) { 'x'*256 }
        let(:l_name) { 'x'*256 }
        
        it 'is invalid' do
          author = Author.new(f_name: f_name, l_name: l_name)
          expect(author.valid?).to be_falsey
          expect(author.errors.keys).to include(:f_name, :l_name)
        end
      end
    end
  end
end
