class Book < ActiveRecord::Base
  has_many :lists
  belongs_to :user
  has_many :users, through: :lists
end
