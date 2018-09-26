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

  describe 'ActiveModel validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:first_name).ignoring_case_sensitivity.scoped_to(:last_name).with_message('This author already exists') }
    it { should validate_uniqueness_of(:last_name).ignoring_case_sensitivity.scoped_to(:first_name).with_message('This author already exists') }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(author).to respond_to(:full_name) }
    end

    context 'executes methods correctly' do
      context '#full_name' do
        it 'returns full name of author' do
          expect(author.full_name).to eq("#{author.first_name} #{author.last_name}")
        end
      end
    end
  end
end
