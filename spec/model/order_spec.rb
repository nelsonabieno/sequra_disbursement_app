require 'rails_helper'

# Test suite for the Order model
RSpec.describe Order, type: :model do
  # Association test
  it { should belong_to(:merchant) }
  it { should belong_to(:shopper) }

  # Validation tests
  it { should validate_presence_of(:amount) }
end