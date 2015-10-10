class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :value
  validates_numericality_of :value
end
