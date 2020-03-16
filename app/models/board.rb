class Board < ApplicationRecord
  belongs_to :community
  has_many :users, through: :board_users

  validates :text, presence: true, unless: :image?
end
