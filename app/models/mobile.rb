class Mobile < ActiveRecord::Base
  belongs_to :budget
  has_many :plates
  validates_presence_of :multiplier, :name
  validates_numericality_of :multiplier
  def total_value
  	total_value = 0
  	self.plates.each do |plate|
  		total_value+= plate.value 
  	end
  	total_value
  end

end
