class Order < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :shopper

  validates :amount, presence: true
end