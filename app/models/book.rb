class Book < ApplicationRecord
  has_and_belongs_to_many :authors

  enum format: %i[hardcover softcover digital]

  validates :title, :release_date, presence: true
  validates :base_price, presence: true, if: :new_book?

  def new_book?
    return false unless release_date.present?
    release_date >= DateTime.now - 2.months
  end

  def self.formats_names
    formats.keys
  end
end
