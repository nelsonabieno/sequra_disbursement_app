require 'rails_helper'

# Test suite for the Merchant model
RSpec.describe Merchant, type: :model do
  # Association test
  it { should have_many(:orders) }
  it { should have_many(:disbursements) }
  it { should have_many(:shoppers).through(:orders) }

  # Validation tests
  it { should validate_presence_of(:cif) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end