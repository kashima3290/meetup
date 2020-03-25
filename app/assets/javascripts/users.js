$(function() {
  function addUser(user) {
    let html = `
    <div class="chat-group-user form-control">
        <a class="chat-group-user__name">${user.name}</a>
        <div class="float-right user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
    </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
    <div class='form-control w-75 position-fixed'>ユーザーが見つかりません</div>
    `;
    $("#user-search-result").append(html);
  }

  function addDeleteUser(name, id) {
    let html = `
    <div class="chat-group-user clearfix form-control" id="${id}">
      <a class="chat-group-user__name">${name}</a>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn float-right" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>
    `;
    $(".js-add-user").append(html);
  }

  function addMember(userId) {
    let html = `
    <input value="${userId}" name="community[user_ids][]" type="hidden" id="group_user_ids_${userId}" />
    `;
    $(`#${userId}`).append(html);
  }

  $("#user-search").on("keyup", function() {
    let input = $("#user-search").val();
    $.ajax({
      type: "get",
      url: "/api/users",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(users) {
      $("#user-search-result").empty();

      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function() {
      alert("通信エラーです");
    });
  });
  $(document).on("click", ".chat-group-user__btn--add", function() {
    console.log
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });
  $(document).on("click", ".chat-group-user__btn--remove", function() {
    $(this)
      .parent()
      .remove();
  });
});