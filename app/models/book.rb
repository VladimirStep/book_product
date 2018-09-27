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

  def authors_names
    authors.map { |author| "#{author.full_name}" }.join(', ')
  end

  def self.released_in(year)
    return none unless year
    parsed_date = Date.new(year) rescue nil
    return none unless parsed_date
    includes(:authors)
        .where(format: formats[:hardcover])
        .where(release_date: (parsed_date.beginning_of_year..parsed_date.end_of_year))
  end

  def short_title
    pattern = /^\ba\b\s+|^\bthe\s+\b/i
    title.gsub(pattern, '')[0, 20]
  end

  def release_year
    release_date.year
  end

  def simple_release_format
    release_date.strftime('%m-%d-%Y')
  end

  def main_author
    authors.first
  end

  def main_author_first_name
    main_author&.first_name
  end

  def main_author_last_name
    main_author&.last_name
  end

  def main_author_full_name
    "#{main_author_first_name} #{main_author_last_name}".strip
  end
end
