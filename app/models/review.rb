class Review < ApplicationRecord
  belongs_to :user
  belongs_to :workplace

  has_many :ratings , inverse_of: :review
  accepts_nested_attributes_for :ratings

  validates :comment,
  presence: true,
  length: {maximum: 480},
  on: :create,
  allow_nil: false
end
