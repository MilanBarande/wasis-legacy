class Rating < ApplicationRecord
  belongs_to :review

  DESCRIPTIONS = ["wifi", "noise", "comfort", "service"]

  validates :comment,
  presence: true,
  length: {maximum: 480},
  on: :create,
  allow_nil: false
end
