class User < ActiveRecord::Base
  has_many :clients
  has_many :items
  devise :database_authenticatable, :registerable, :trackable
  validates_presence_of :email
end
