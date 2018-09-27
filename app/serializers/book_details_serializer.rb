class BookDetailsSerializer < ActiveModel::Serializer
  attributes :id, :title, :base_price
  attribute :simple_release_format, key: :release_date
  attribute :currency, key: :currency_name
  attribute :main_author_first_name, key: :author_first_name
  attribute :main_author_last_name, key: :author_last_name
  attribute :format, key: :format_name
end
