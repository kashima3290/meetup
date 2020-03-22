class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :community_users
  has_many :communities, through: :community_users
  has_many :messages
  has_many :parts
  has_many :board_users
  has_many :boards, through: :board_users
  
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end
