FactoryBot.define do
  factory :order_address do
    postal_code { "#{rand(100..999)}-#{rand(1000..9999)}" }
    prefecture_id { rand(2..48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
