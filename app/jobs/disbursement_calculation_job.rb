class DisbursementCalculationJob < ApplicationJob
  queue_as :default

  def perform
    Disbursement.calculate_weekly_orders!
  end
end
