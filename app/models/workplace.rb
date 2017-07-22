class Workplace < ApplicationRecord

  mount_uploader :photo, PhotoUploader


  has_many :features, through: :workplacefeatures
  has_many :workplacefeatures, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :workplacephotos, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :address, presence: true
  validates :category, presence: true
  validates :name, presence: true

end
