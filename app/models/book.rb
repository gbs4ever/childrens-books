class Book < ActiveRecord::Base
  has_many :lists
  belongs_to :user
  has_many :users, -> {distinct}, through: :lists
end
