class Community < ApplicationRecord
  has_many :community_users
  has_many :users, through: :community_users
  has_many :messages
  has_many :boards
  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
