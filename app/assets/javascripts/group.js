
$(function() {

  var search_list = $("#list");
  var member_list = $("#chat-group-users");
  var preWord;

  function appendUser(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user.name }</div>
                  <div class='chat-group-user__btn chat-group-user__btn--add'
                   data-name='${ user.name }' data-id='${ user.id }'>追加</div>
                </li>`;
    search_list.append(html);
  }

  function appendNouser(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user }</div>
                </li>`
    search_list.append(html);
  }

  function appendMember(name, id) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ name }
                    <input type='hidden' name='group[user_ids][]' id='group_user_ids_' value='${ id }'></div>
                  <div class='chat-group-user__btn chat-group-user__btn--remove'
                   data-name='${ name }' data-id='${ id }'>削除</div>
                </li>`;
    member_list.append(html);
  }

   $(document).on('click', '.chat-group-user__btn--add', function(){

    var name = $(this).data("name");
    var id = $(this).data("id");
    appendMember(name, id);
    $(this).parent().remove();

  });

  $(document).on('click', '.chat-group-user__btn--remove', function(){

    $(this).parent().remove();

  });

  $("#chat-group-form__input").on("keyup", function() {

    var input = $("#chat-group-form__input").val();

    if(input !== preWord){

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
     preWord = input;
   }
  });
});
