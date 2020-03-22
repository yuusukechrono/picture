class Picture < ApplicationRecord
  mount_uploader:upload, UploadUploader
  validates :content, length: { maximum: 50 } 
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
