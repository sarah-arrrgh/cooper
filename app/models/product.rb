class Product < ActiveRecord::Base
  has_many :orders
  has_many :prices  
end
