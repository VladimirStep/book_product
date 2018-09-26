class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name,
                                       case_sensitive: false,
                                       message: 'This author already exists' }
  validates :last_name, uniqueness: { scope: :first_name,
                                      case_sensitive: false,
                                      message: 'This author already exists' }

  def full_name
    "#{first_name} #{last_name}"
  end
end
