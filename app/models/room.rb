class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
