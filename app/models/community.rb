class Community < ApplicationRecord
  has_many :community_users
  has_many :users, through: :community_users
  has_many :messages
  has_many :boards
  has_many :parts
  acts_as_taggable
  
  def self.search(search)
    if search
      Community.where('name LIKE(?)', "%#{search}%")
    else
      Community.all
    end
  end

  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
