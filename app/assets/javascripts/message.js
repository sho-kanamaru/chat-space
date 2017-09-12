$(function() {
  function buildflash(message) {
    var flash = `<div class="notice">
                  ${ message.flash }
                </div>`;
    return flash;
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
