class DisbursementsController < ApplicationController
  # returns the total disbursements for a given merchant
  def index
    disbursements = Disbursement.disbursed_amount(amount)
    result = disbursements.disbursed_amount
    render json: { amount: result }
  end

  private

  def merchant
    Merchant.find(disbursement_params[:merchant_id])
  end

  def disbursement_params
    params.permit(:date, :merchant_id)
  end
end
