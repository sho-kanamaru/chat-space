class Group < ApplicationRecord
  validates :name, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages

  def latest_message
    self.messages.last.try(:body) || "まだメッセージはありません"
  end

  def delete(current_user)
    other_users = self.users.select{|user| user != current_user}
    return other_users
  end
  
end
