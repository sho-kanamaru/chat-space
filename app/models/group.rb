class Group < ApplicationRecord
  validates :name, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages
  has_many :message_recipients

  def latest_message
    if self.messages.last == nil
      "まだメッセージはありません"
    elsif self.messages.last.image.url == nil
      self.messages.last.try(:body)
    else
      "画像が送信されました"
    end
  end
end
