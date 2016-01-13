class Coop < ActiveRecord::Base
  has_many :members_coop
  has_many :members, through: :members_coop
  has_many :suppliers, through: :coop_suppliers  
end
