FactoryBot.define do
  factory :order do
    merchant_id nil
    shopper_id nil
    amount nil
    completed_at {'2018-01-23 20:10:00'}
  end
end
