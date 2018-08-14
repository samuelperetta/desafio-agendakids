FactoryGirl.define do
  factory :school_unity do
    name { Faker::GameOfThrones.house}
    address { Faker::Address.full_address }
  end
end
