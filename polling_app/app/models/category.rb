class Category < ApplicationRecord
  has_many :polls
   has_many :mypolls
end
