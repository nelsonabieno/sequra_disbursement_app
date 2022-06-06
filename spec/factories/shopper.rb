FactoryBot.define do
  factory :shopper do
    id { 1 }
    name { Faker::Name.name   }
    email { Faker::Internet.email }
    nif { Faker::Alphanumeric.alphanumeric(number: 10)}
  end
end
