$(function() {
  function buildHTML(message) {

    var image = ""

    if(message.image) {
      var image = `<div class="right-box__message__box__detail--image">
                  <img src=${ message.image } alt= "image">
                </div>`;
    }

    var html = `<div class="right-box__message__box__detail">
                  <div class="right-box__message__box__detail--name">
                    ${ message.name }
                  </div>
                  <div class="right-box__message__box__detail--date">
                    ${ message.date }
                  </div>
                  <div class="right-box__message__box__detail--content">
                    ${ message.body }
                  </div>
                  ${ image }
                </div>`;
    return html;
  }

  function buildflash(message) {
    var flash = `<div class="notice">
                  ${ message.flash }
                </div>`;
    return flash;
  }

  if(document.URL.match("/messages")) {
    setInterval(autoload, 10000);
  }

  function autoload(){

    var current_url = location.href;
    var last_message_id = $(".right-box__message__box__detail:last-child").data("id");
    console.log(last_message_id);

    $.ajax({
      type: 'GET',
      url: current_url,
      data: {
        last_message_id: last_message_id
      },
      dataType: 'json'
    })

    .done(function(data) {
      $.each(data, function(i, message) {
        var html = buildHTML(message);
        $('.right-box__message__box').append(html);
        if(data.length){
          var last_message_id = $(".right-box__message__box__detail:last-child");
          scroll_to_bottom(last_message_id);
        }
      });
    })
    .fail(function() {
      alert('error');
    });
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
      console.log(data);
      var html = buildHTML(data);
      $('.right-box__message__box').append(html);
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
