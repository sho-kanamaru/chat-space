$(function() {
  function buildflash(message) {
    var flash = `<div class="notice">
                  ${ message.flash }
                </div>`;
    return flash;
  }

  function scroll_to_bottom(target_id) {
    $('.right-box__message').animate({scrollTop: target_id.offset().top});
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    $('.notice').remove();

    var formData = new FormData($(this).get(0));

    $.ajax({
      type: 'POST',
      url: './messages',
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    .done(function(data) {
      App.chat.put_message(data);

      var last_message_id = $(".right-box__message__box__detail:last-child");
      scroll_to_bottom(last_message_id);

      var flash = buildflash(data);
      $('body').prepend(flash);
      $('#new_message')[0].reset();
    })
    .fail(function() {
      alert('error');
    });
    return false;
  });
});
