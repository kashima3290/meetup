class Board < ApplicationRecord
  belongs_to :community
  has_many :users, through: :board_users
  has_many :messages

  validates :text, presence: true, unless: :image?
end
