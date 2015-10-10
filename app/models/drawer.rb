class Drawer < ActiveRecord::Base
  belongs_to :mobile
  validates_presence_of :height, :width, :front_plate, :back_plate, :internal, :slide, :qtd, :depth
  def total_value
  	value  = 0
  	value += calculate_plate(self.height, self.width, self.front_plate, 1) #Frente
  	value += calculate_plate(self.height * 0.8, self.width, self.internal, 1) #Sustenta frente
  	value += calculate_plate(self.height * 0.8, self.width, self.back_plate, 1) #Fundo de trás
  	value += calculate_plate(self.depth, self.width, self.back_plate, 1) #Fundo de baixo
  	value += calculate_plate(self.depth, self.height * 0.8, self.internal, 2) #Laterais
  	value += self.slide
  	value  = value * self.qtd
  	value
  end

  def calculate_plate(height, width, plate_value, qtd)
  	(((height*width) * plate_value)/50875)*qtd
  end
end
