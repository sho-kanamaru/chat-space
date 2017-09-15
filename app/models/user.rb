class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :messages
  has_many :message_recipients
  validates :name, presence: true

  scope :not_current_users, ->(group, user) { joins(:groups_users).merge(GroupsUser.where(["group_id = ? and user_id != ?", group, user])) }

  def join_group?(group)
    groups.include?(group)
  end
end
