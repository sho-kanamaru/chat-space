class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :message_recipients
  validates :body, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :message_recipients
end
