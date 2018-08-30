class Photo < ApplicationRecord
  belongs_to :step

  mount_uploader :picture, PhotoUploader

  scope :with_picture, -> { where.not(picture: nil) }
end
