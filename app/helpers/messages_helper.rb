module MessagesHelper
  def message_date(message)
    message.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
