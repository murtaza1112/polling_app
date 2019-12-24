class Mypoll < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :page
end
