class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :messages
  validates :name, presence: true

  scope :not_current_users, -> { joins(:groups_users) }
end
