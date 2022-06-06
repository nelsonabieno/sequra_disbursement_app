class Disbursement < ActiveRecord::Base
  belongs_to :merchant

  validates :disbursed_amount, presence: true

  # deducts fee and calculate the disbursed amount
  def self.disbursed_amount(amount)
    if amount < 50
      amount * 0.01
    elsif amount >= 50 && amount <= 300
      amount * 0.0095
    else
      amount * 0.0085
    end
  end
end