class Review < ApplicationRecord
  belongs_to :user
  belongs_to :workplace
  has_many :ratings

  validates :comment, length: { minimum: 20 }
  validates :workplace, presence: true
end
