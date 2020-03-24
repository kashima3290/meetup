class Board < ApplicationRecord
  belongs_to :community
  has_many :board_users
  has_many :users, through: :board_users
  has_many :messages
  has_many :parts


  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
