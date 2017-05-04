module MessagesHelper
  def message_date(message)
    message.created_at.to_s(:datetime)
  end
end
