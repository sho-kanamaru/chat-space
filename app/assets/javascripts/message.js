$(function() {
  function buildflash_notice(message) {
    var flash = `<div class="notice">
                  ${ message.flash_notice }
                </div>`;
    return flash;
  }

  function buildflash_alert(message) {
    var flash = `<div class="alert">
                  ${ message.flash_alert }
                </div>`;
    return flash;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    $('.notice').remove();
    $('.alert').remove();

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

      if (data.flash_notice != null) {
        var flash = buildflash_notice(data);
        App.chat.put_message(data);
        $('#new_message')[0].reset();
      } else {
        var flash = buildflash_alert(data);
      }

      $('body').prepend(flash);
    })
    .fail(function() {
      alert('error');
    });
    return false;
  });

  $('.right-box__message__box__detail--reading').balloon();

});
