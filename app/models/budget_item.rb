class BudgetItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :mobile
  validates_presence_of :item_id, :qtd
  validates_numericality_of :qtd 

  def total_value
  	self.qtd * self.item.value
  end
end
