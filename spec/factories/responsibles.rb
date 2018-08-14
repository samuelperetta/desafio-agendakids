FactoryGirl.define do
  factory :responsible do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(11) }
    address { Faker::Address.full_address }
  end
end
