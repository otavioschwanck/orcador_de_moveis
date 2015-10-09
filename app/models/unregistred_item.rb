class UnregistredItem < ActiveRecord::Base
  validates_numericality_of :qtd, :value
  validates_presence_of :qtd, :value
  belongs_to :mobile

  def total_value
  	self.qtd * self.value
  end

end
