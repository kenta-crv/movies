class President < ApplicationRecord
  mount_uploader :face, ImagesUploader
  belongs_to :company
end
