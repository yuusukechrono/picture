class Picture < ApplicationRecord
  mount_uploader:upload, UploadUploader
  validates :content, length: { maximum: 50 } 
  belongs_to :user
end
