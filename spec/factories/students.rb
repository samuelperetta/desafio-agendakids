FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    registration { Faker::Number.number(6) }
  end
end
