class Disbursement < ActiveRecord::Base
  belongs_to :merchant

  validates :disbursed_amount, presence: true
end