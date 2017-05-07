json.array! @update_message do |message|
  json.data message.id
  json.body message.body
  json.image message.image.url
  json.name message.user.name
  json.date message_date(message)
end
