class Plate < ActiveRecord::Base
  belongs_to :mobile
  validates_numericality_of :height, :width, :plate_value, :qtd
  validates_presence_of :width, :height, :plate_value, :qtd

  def value
  	(((self.height*self.width) * self.plate_value)/50875)*self.qtd
  end
end
