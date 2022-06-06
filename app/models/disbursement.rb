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

  # calculate and return merchant disbursements for a given week for a merchant
  # if no given merchant id is provided
  # it calculates and returns disbursements for all the merchants
  def self.calculate_weekly_orders!(merchant: nil, date: Date.today)
    begin
      start_date = date.beginning_of_week
      end_date = date.end_of_week

      if merchant
        disbursement = store_disbursement(merchant, start_date, end_date)
        return  { disburse_amount: disbursement.disbursed_amount, merchant_id: merchant.id }
      else
        results = []
        Merchant.all.each do |merchant|
          disbursement = store_disbursement(merchant, start_date, end_date)
          results << { disburse_amount: disbursement.disbursed_amount, merchant_id: merchant.id }
        end
        return results
      end
    rescue StandardError => e
      puts e.message
    end
  end

  # store_disbursement try to find disbursement
  # based on start and end date provided
  # method create a disbursement if none is found
  def self.store_disbursement(merchant, start_date, end_date)
    find_or_create_by(start_date: start_date,end_date: end_date, merchant_id: merchant.id) do |disbursement|
      week_completed_orders = merchant.orders.completed.date_range(start_date, end_date)
      total = week_completed_orders.sum{ |order| disbursed_amount(order.amount) }
      disbursement.disbursed_amount = total
    end
  end
end