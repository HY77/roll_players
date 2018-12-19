class PlayerImage < ApplicationRecord
  belongs_to :article

  mount_uploader :image, PlayerImageUploader
end
