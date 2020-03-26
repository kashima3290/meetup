class Board < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_many :image, through: :board_images
  acts_as_taggable


  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
