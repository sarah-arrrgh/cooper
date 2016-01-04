class MembersCoop < ActiveRecord::Base
  belongs_to :member
  belongs_to :coop
end
