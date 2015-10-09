class Budget < ActiveRecord::Base
  belongs_to :client
  has_many :mobiles
  def total_value
  	total_value = 0
  	self.mobiles.each do |mobile| 
  		total_value += (mobile.total_value * mobile.multiplier)
  	end
  	total_value
  end
end
