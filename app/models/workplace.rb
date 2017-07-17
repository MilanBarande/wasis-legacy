class Workplace < ApplicationRecord

  has_many :features, through: :workplacefeatures
  has_many :visits
  has_many :workplacephotos
  has_many :favourites
  has_many :reviews

  validates :address, presence: true
  validates :type, presence: true
  validates :name, presence: true

end
