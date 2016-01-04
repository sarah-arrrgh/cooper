class Product < ActiveRecord::Base
  has_many :actual_orders
  has_many :wishing_lists
end
