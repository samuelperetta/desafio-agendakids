FactoryGirl.define do
  factory :school do
    name { Faker::University.name}
    cnpj { CNPJ.generate }
  end
end
