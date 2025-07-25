class User < ApplicationRecord
  has_one_attached :avatar
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Follow system
  acts_as_follower
  acts_as_followable

  validates :bio, length: { maximum: 500 }, allow_blank: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end
