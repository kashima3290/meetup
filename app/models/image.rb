class Image < ApplicationRecord
  has_many :boards, through: :board_images
end
