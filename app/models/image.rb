class Image < ApplicationRecord
  has_many :boards_users
  has_many :boards, through: :board_images
end
