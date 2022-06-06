class DisbursementsController < ApplicationController
  # returns the total disbursements for a given merchant
  def index
    disbursements = Disbursement.calculate_weekly_orders!(merchant: merchant, date: Date.parse(disbursement_params[:date]))
    result = disbursements.disbursed_amount
    render json: { total_disbursement: result }
  end

  private

  def merchant
    Merchant.find(disbursement_params[:merchant_id])
  end

  # strong parameters
  def disbursement_params
    params.permit(:date, :merchant_id)
  end
end
