class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :community_users
  has_many :communities, through: :community_users
  has_many :messages
  has_many :parts
  has_many :comments
  acts_as_followable
  acts_as_follower
  
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end
