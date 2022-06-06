require 'rails_helper'

# Test suite for the Disbursement model
RSpec.describe Disbursement, type: :model do
  # Association test
  it { should belong_to(:merchant) }

  # Validation tests
  it { should validate_presence_of(:disbursed_amount) }
end