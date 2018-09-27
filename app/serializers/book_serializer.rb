class BookSerializer < ActiveModel::Serializer
  attributes :id, :base_price
  attribute :short_title, key: :title
  attribute :release_year, key: :release_date
  attribute :main_author_full_name, key: :author_name
end
