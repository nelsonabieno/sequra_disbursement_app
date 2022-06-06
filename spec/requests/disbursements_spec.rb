require 'rails_helper'

RSpec.describe "Disbursements", type: :request do
  # initialize test data
  let!(:date) { order.first.completed_at }
  let(:merchant_id) { merchant.first.id }

  # Test suite for GET /disbursements
  describe 'GET /disbursements' do
    # make HTTP get request before each example
    before { get '/disbursements', params: {date: date, merchant_id: merchant_id }}

    it 'returns merchant disbursement for a given week' do
      expect(response.body).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

