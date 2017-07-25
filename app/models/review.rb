class Review < ApplicationRecord
  belongs_to :user
  belongs_to :workplace
  has_many :ratings , dependent: :destroy

  validates :workplace, presence: true
  validates :comment,
  presence: true,
  length: {maximum: 480},
  on: :create,
  allow_nil: false
end
