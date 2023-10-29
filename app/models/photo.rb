class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many_attached :images
end
