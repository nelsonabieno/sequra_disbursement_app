FactoryBot.define do
  factory :order do
    merchant_id { 1 }
    shopper_id { 1 }
    amount { 50.5 }
    completed_at {'2018-01-23 20:10:00'}
  end
end
