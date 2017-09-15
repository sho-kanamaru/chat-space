module MessagesHelper
  def message_date(message)
    message.created_at.to_s(:datetime)
  end

  def reading_judgment(group)
    group.message_recipients.where(user_id: current_user.id).unread.empty?
  end

  def unread_message_count(group)
    group.message_recipients.where(user_id: current_user.id).unread.size
  end
end
