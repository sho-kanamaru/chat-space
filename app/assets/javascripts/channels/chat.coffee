App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message) ->
    image = '<div class="right-box__message__box__detail--image">' +
              "<img src＝#{message.image} alt= 'image'>" +
            '</div>'

    if message.body and message.image
      html = "<div class='right-box__message__box__detail' data-id= #{message.data} >" +
               '<div class="right-box__message__box__detail--name">' +
                  message.name +
               '</div>' +
               '<div class="right-box__message__box__detail--date">' +
                  message.date +
               '</div>' +
               '<div class="right-box__message__box__detail--content">' +
                  message.body +
               '</div>' +
                image +
              '</div>'

    else if message.body
      html = "<div class='right-box__message__box__detail' data-id= #{message.data} >" +
               '<div class="right-box__message__box__detail--name">' +
                  message.name +
               '</div>' +
               '<div class="right-box__message__box__detail--date">' +
                  message.date +
               '</div>' +
               '<div class="right-box__message__box__detail--content">' +
                  message.body +
                '</div>' +
             '</div>'

    else if message.image
      html = "<div class='right-box__message__box__detail' data-id= #{message.data} >" +
               '<div class="right-box__message__box__detail--name">' +
                  message.name +
               '</div>' +
               '<div class="right-box__message__box__detail--date">' +
                  message.date +
               '</div>' +
               '<div class="right-box__message__box__detail--content">' +
               '</div>' +
                image +
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
