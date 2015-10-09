class Client < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  has_many :budgets
end
