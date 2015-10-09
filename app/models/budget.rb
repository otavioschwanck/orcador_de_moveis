class Budget < ActiveRecord::Base
  belongs_to :client
  has_many :mobiles
end
