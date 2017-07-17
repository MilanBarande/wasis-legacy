class Review < ApplicationRecord
  belongs_to :user
  belongs_to :workplace
  has_many :ratings
end
