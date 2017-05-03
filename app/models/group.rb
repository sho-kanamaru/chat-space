class Group < ApplicationRecord
  validates :name, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages

  def latest_message
    self.messages.last.try(:body) || "まだメッセージはありません"
  end
end
