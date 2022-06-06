class Shopper < ActiveRecord::Base
  has_many :orders
  has_many :merchants, :through => :orders

  validates :nif, presence: true
  validates :name, presence: true
  validates :email, presence: true
end