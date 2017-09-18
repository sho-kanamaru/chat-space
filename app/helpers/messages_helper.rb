module MessagesHelper
  def message_date(message)
    message.created_at.to_s(:datetime)
  end

  def reading_judgment(group)
    group.message_recipients.where(user_id: current_user.id).unread.empty?
  end

  def read_message_count(message)
    message.message_recipients.read.size - 1
  end

  def read_message_member(message)
    read_members = User.joins(:message_recipients).merge(MessageRecipient.where(message_id: message.id).where.not(user_id: current_user.id).read)
    members = ""
    read_members.each do |read_member|
      members << "#{read_member.name}, "
    end
    return members
  end

  def unread_message_count(group)
    group.message_recipients.where(user_id: current_user.id).unread.size
  end
end
