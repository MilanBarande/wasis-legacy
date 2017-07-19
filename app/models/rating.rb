class Rating < ApplicationRecord
  belongs_to :review

  DESCRIPTIONS = ["wifi", "noise", "comfort", "service"]
end
