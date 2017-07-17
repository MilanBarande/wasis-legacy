class User < ApplicationRecord

  has_many :visits
  has_many :workplacephotos
  has_many :favourites
  has_many :reviews


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
