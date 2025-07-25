class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many_attached :images

  # acts_as_taggable_on :collections  # Or use :tags if you prefer

  acts_as_commentable
  #  acts_as_taggable_on :tags
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
end
