FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username(specifier: 5..8) }
    email { Faker::Internet.unique.email }
    password { 'password123' } # 英数混合6文字以上でバリデーション安定
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 60) }
  end
end
