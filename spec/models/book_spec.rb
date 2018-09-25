require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has valid factory' do
    expect(build(:book)).to be_valid
  end

  let(:book) { build(:book) }
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

  describe 'public instance methods' do
    context 'responds to its methods' do

    end
  end
end
