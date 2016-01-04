class CoopSupplier < ActiveRecord::Base
  belongs_to :coop
  belongs_to :supplier
end
