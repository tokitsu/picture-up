class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :title, presence: true, length:{maximum: 40}
  validates :image, presence: true
end
