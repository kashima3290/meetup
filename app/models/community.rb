class Community < ApplicationRecord
  has_many :community_users
  has_many :users, through: :community_users
  has_many :messages
  validates :name, presence: true
end
