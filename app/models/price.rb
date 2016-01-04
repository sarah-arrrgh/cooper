class Price < ActiveRecord::Base
  belongs_to :price_list
  belongs_to :product
end
