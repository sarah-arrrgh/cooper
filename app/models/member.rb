class Member < ActiveRecord::Base
  has_many :actual_orders
  has_many :wishing_lists
  has_many :coops, through: :members_coop
end
