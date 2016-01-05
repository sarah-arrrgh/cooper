class Supplier < ActiveRecord::Base
  has_many :price_lists
  has_many :prices, through: :price_lists
  has_many :products, through: :prices
end
