json.date @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.body @message.body
json.name @message.user.name
