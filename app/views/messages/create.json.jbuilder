json.date message_date(@message)
json.body @message.body
json.name @message.user.name
json.image @message.image.url
json.data @message.id
json.message_user_id @message.user_id
json.user_id current_user.id
json.group_id @message.group.id
json.flash_notice flash[:notice]
json.unread_count_messages @unread_count_messages

