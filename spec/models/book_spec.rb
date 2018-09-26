require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has valid factory' do
    expect(build(:book)).to be_valid
  end

  let(:book) { build(:book) }
  let(:new_book) { build(:book, release_date: DateTime.now - 1.month) }
  let(:old_book) { build(:book, release_date: DateTime.now - 3.months) }
  subject { book }

  describe 'database' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:release_date).of_type(:date) }
    it { should have_db_column(:base_price).of_type(:decimal).with_options(precision: 8, scale: 2) }
    it { should have_db_column(:currency).of_type(:string) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:authors) }
  end

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:release_date) }

    it 'validates presence of price for new books' do
      expect(new_book).to_not allow_value(nil).for(:base_price)
      expect(new_book).to_not allow_value('').for(:base_price)
    end

    it 'does not validate presence of price for old books' do
      expect(old_book).to allow_value(nil).for(:base_price)
      expect(old_book).to allow_value('').for(:base_price)
    end
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(book).to respond_to(:new_book?) }
    end

    context 'executes methods correctly' do
      context '#new_book?' do
        it 'returns true if release date is within 2 month from now' do
          expect(new_book.new_book?).to be_truthy
        end

        it 'returns false if release date is older then 2 months' do
          expect(old_book.new_book?).to be_falsey
        end
      end
    end
  end
end
