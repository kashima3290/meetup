class Board < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_many :images
  has_many :comments
  acts_as_taggable


  # validates :text, presence: true, unless: :images?

  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  attr_accessor :delete_images
  after_validation do
    uploaders = images.delete_if do |uploader|
      if Array(delete_images).include?(uploader.file.identifier)
        uploader.remove!
        true
      end
    end
    write_attribute(:images, uploaders.map { |uploader| uploader.file.identifier })
  end

  def images=(files)
    appended = files.map do |file|
      uploader = _mounter(:images).blank_uploader
      uploader.cache! file
      uploader
    end
    super(images + appended)
  end


  def self.search(search)
    if search
      Board.where('text LIKE(?)', "%#{search}%") 
    else
      Board.all
    end
  end
end
