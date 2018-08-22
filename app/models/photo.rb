class Photo < ApplicationRecord
  belongs_to :step
  mount_uploader :picture, PhotoUploader
end
