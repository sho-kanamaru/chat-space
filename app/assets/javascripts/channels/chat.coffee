App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message) ->
    buildMessageBody = (message) ->
      body = '<div class="right-box__message__box__detail--content">' +
                message.body +
             '</div>'
      image = '<div class="right-box__message__box__detail--image">' +
                "<img src＝'#{message.image}' alt='image'>" +
              '</div>'
      if message.body and message.image
          html = body + image
      else if message.body
          html = body
      else
          html = image
      return html

    buildMessageCount = (unread_count) ->
      all_unread_count = unread_count + 1
      html = '<div class="left-box__talk__detail--unread_count">' +
                '<p>' +
                  all_unread_count +
                '</p>' +
              '</div>'
      return html

    scroll_to_bottom = (target_id) ->
      $('.right-box__message').animate scrollTop: target_id
      return

    message_content = buildMessageBody message
    html = "<div class='right-box__message__box__detail' data-id= #{message.data} >" +
             '<div class="right-box__message__box__detail--name">' +
               message.name +
             '</div>' +
             '<div class="right-box__message__box__detail--date">' +
               message.date +
             '</div>' +
             message_content +
           '</div>'

    last_message_id = $('.right-box__message__box__detail:last-child')
    last_message_height = last_message_id[0].offsetTop

    real_path = location.pathname
    path = "/groups/#{message.group_id}/messages"

    if real_path == path
        $('.right-box__message__box').append html
        scroll_to_bottom last_message_height

    if message.body == ''
        $('#left-box__talk__detail-' + message.group_id).text '画像が送信されました'
    else
        $('#left-box__talk__detail-' + message.group_id).text message.body

    if real_path != path
        for key of message.unread_count_messages
          $('#left-box__talk .left-box__talk__detail--unread_count').remove()
          unread_message_count = buildMessageCount message.unread_count_messages[key]
          $('#left-box__talk-' + message.group_id + '-user'+ key).append unread_message_count

  put_message: (msg) ->
    @perform('put_message', { message: msg })

