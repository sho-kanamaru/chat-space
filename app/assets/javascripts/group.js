$(function() {

  var list = $("#list");
  var preWord;

  function appendUser(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user.name }</div>
                  <div class='chat-group-user__btn chat-group-user__btn--add'
                   data-name='${ user.name }' data-id='${ user.id }'>追加</div>
                </li>`;
    list.append(html);
  }

  function appendNouser(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user }</div>
                </li>`
    list.append(html);
  }

  $("#chat-group-form__input").on("keyup", function() {

    var input = $("#chat-group-form__input").val();

     $.ajax({
        type: 'GET',
        url: '/users/search',
        data: { keyword: input },
        dataType: 'json'
      })

     .done(function(data) {

      if (input.length === 0) {
        $("#list li").remove();
      }

       if ( input.length !== 0) {
          $("#list li").remove();
          $.each(data.users, function(i, user) {
            appendUser(user);
        });

       if (data.users.length === 0) {
        appendNouser("一致するユーザーはいません");
      }
     }
    })
     .fail(function() {
       alert('error');
     });
  });
});
