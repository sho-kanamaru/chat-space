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

    $('.right-box__message__box').append html

    last_message_id = $('.right-box__message__box__detail:last-child')
    last_message_height = last_message_id[0].offsetTop

    scroll_to_bottom = (target_id) ->
      $('.right-box__message').animate scrollTop: target_id
      return

    scroll_to_bottom last_message_height

  put_message: (msg) ->
    @perform('put_message', { message: msg })

