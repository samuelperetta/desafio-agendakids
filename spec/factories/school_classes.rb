FactoryGirl.define do
  factory :school_class do
    name { Faker::Name.name }
    shift { SchoolClass.shifts.to_a.sample[1] }
  end
end
