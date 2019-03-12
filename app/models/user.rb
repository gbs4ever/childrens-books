class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password
  has_secure_password
  has_many :lists
  has_many :books
  #has_many :books, through: :lists
end
