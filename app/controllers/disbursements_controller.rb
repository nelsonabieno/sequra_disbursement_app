class DisbursementsController < ApplicationController
  # returns the total disbursements for a given merchant
  # and if no merchant is provided it returns disbursement
  # for all merchants
  def index
    if merchant.present?
      disbursements = Disbursement.calculate_weekly_orders!(merchant: merchant, date: Date.parse(disbursement_params[:date]))
      result = disbursements[:disburse_amount]
    else
      disbursements = Disbursement.calculate_weekly_orders!(date: Date.parse(disbursement_params[:date]))
      result = disbursements
    end

    render json: { total_disbursement: result }, status: :ok
  end

  private
  # finds a merchant based on the merchant id
  def merchant
    Merchant.find_by_id(disbursement_params[:merchant_id])
  end

  # strong parameters
  def disbursement_params
    params.permit(:date, :merchant_id)
  end
end
