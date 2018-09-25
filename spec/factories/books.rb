FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    release_date { Faker::Date.between(2.months.ago, Date.today) }
    base_price { Faker::Number.decimal(2) }
    currency { Faker::Currency.symbol }
    # authors
  end
end
