class Card < ApplicationRecord
  mount_uploader :image, ImageUploader
end
