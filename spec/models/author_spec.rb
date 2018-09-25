require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'has valid factory' do
    expect(build(:author)).to be_valid
  end

  let(:author) { build(:author) }
  subject { author }

  describe 'database' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:books) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do

    end
  end
end
