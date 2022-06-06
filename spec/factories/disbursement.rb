FactoryBot.define do
  factory :disbursement do
    merchant_id nil
    disbursed_amount { Faker::Number.number(10) }
  end
end