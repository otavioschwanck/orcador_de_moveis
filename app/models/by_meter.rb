class ByMeter < ActiveRecord::Base
  belongs_to :mobile
  validates_numericality_of :height, :width, :meter_price, :qtd
  validates_presence_of :width, :height, :meter_price, :qtd

  def total_value
  	(((self.width * self.height) * self.meter_price) / 10000 ) * self.qtd
  end
end
