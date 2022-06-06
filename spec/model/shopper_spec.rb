require 'rails_helper'

# Test suite for the Merchant model
RSpec.describe Shopper, type: :model do
  # Association test
  it { should have_many(:orders) }
  it { should have_many(:merchants).through(:orders) }

  # Validation tests
  it { should validate_presence_of(:nif) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end