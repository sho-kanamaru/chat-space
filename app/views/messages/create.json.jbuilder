json.date message_date(@message)
json.body @message.body
json.name @message.user.name
json.flash flash[:notice]
