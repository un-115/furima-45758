FactoryBot.define do
  factory :item do
    name              { Faker::Commerce.product_name }
    info              { Faker::Lorem.paragraph }
    category_id       { rand(2..11) }
    status_id         { rand(2..7) }
    fee_payer_id      { rand(2..3) }
    prefecture_id     { rand(2..48) }
    shopping_day_id   { rand(2..4) }
    price             { rand(300..9999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
