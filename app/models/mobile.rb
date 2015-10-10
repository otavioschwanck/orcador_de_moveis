class Mobile < ActiveRecord::Base
  belongs_to :budget
  has_many :plates, :dependent => :destroy
  has_many :unregistred_items, :dependent => :destroy
  has_many :by_meters, :dependent => :destroy
  has_many :drawers, :dependent => :destroy
  has_many :budget_items, :dependent => :destroy
  validates_presence_of :multiplier, :name
  validates_numericality_of :multiplier
  def total_value
  	total_value = 0

  	self.plates.each do |plate|
  		total_value+= plate.value 
  	end

    self.unregistred_items.each do |unregistred_item| 
      value_to_sum = unregistred_item.total_value
      value_to_sum = value_to_sum / self.multiplier unless unregistred_item.multiplicable
      total_value+= value_to_sum
    end

    self.by_meters.each do |by_meter| 
      value_to_sum = by_meter.total_value
      value_to_sum = value_to_sum / self.multiplier unless by_meter.multiplicable
      total_value+= value_to_sum
    end

    self.drawers.each do |drawer| 
      total_value+= drawer.total_value
    end

    self.budget_items.each do |budget_item| 
      value_to_sum = budget_item.total_value
      value_to_sum = value_to_sum / self.multiplier unless budget_item.multiplicable
      total_value+= value_to_sum
    end



  	total_value
  end

end
