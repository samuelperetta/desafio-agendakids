FactoryGirl.define do
  factory :teacher do
    name { Faker::Name.name }
    registration { Faker::Number.number(6) }
  end
end
