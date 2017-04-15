class Group < ApplicationRecord
  validates :name, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages

  def latest_message
    if self.messages.exists?
      return self.messages.order("created_at DESC")[0].body
    else
      return "まだメッセージはありません"
    end
  end
end
