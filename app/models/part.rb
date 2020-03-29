class Part < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

end
