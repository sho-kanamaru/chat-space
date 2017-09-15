class MessageRecipient < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :message

  enum read_flg: %w(unread read)
end
