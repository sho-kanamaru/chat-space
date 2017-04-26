$(function() {
  function buildHTML(message) {
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
                </div>`;
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();

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
      var html = buildHTML(data);
      $('.right-box__message__box').append(html);
      $('#new_message')[0].reset();
    })
    .fail(function() {
      alert('error');
    });
    return false;
  });
});
