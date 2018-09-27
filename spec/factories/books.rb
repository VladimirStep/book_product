FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    release_date { Faker::Date.between(2.months.ago, Date.today) }
    base_price { Faker::Number.decimal(2) }
    currency { Faker::Currency.symbol }

    factory :book_with_authors do
      transient do
        authors_count { 2 }
      end

      after(:create) do |book, evaluator|
          create_list(:author, evaluator.authors_count, books: [book])
      end
    end
  end
end
