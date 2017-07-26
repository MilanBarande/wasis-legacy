class Rating < ApplicationRecord
  belongs_to :review

  def average
    (wifi + comfort + service + noise).fdiv(4)
  end

end
