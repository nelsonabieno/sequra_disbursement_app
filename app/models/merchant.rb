class Merchant < ActiveRecord::Base
  has_many :orders
  has_many :shoppers, :through => :orders
  has_many :disbursements

  validates :cif, presence: true
  validates :name, presence: true
  validates :email, presence: true
end