class Order < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :shopper

  validates :amount, presence: true

  scope :completed, -> { where.not(completed_at: nil) }
  scope :date_range, -> (start_date, end_date) { where(completed_at: (start_date..end_date)) }
end