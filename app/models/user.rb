class User < ActiveRecord::Base
  has_many :clients, :dependent => :destroy
  has_many :items, :dependent => :destroy
  devise :database_authenticatable, :registerable, :trackable
  validates_presence_of :email
end
