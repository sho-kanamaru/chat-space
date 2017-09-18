class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :message_recipients
  validates :body, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :message_recipients

  scope :read_message, ->(group, user) { joins(:message_recipients).merge(MessageRecipient.where(group_id: group, user_id: user).read) }
  scope :unread_message, ->(group, user) { joins(:message_recipients).merge(MessageRecipient.where(group_id: group, user_id: user).unread) }
end
