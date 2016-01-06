class Price < ActiveRecord::Base
  belongs_to :price_list
  belongs_to :product
  validates :price_per_unit, presence: true
end
