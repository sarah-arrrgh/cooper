class Member < ActiveRecord::Base
  has_many :orders
  has_many :coops, through: :members_coop
end
