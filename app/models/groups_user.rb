class GroupsUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  scope :not_user, lambda{ |group, user| where(group_id: group).where.not(user_id: user) }
end
