$(function(){
  function buildHTML(message){
    if ( message.image && message.text ) {
      var html = `
    <div class='message'>
      <div class='message__messanger'>
        <img src=${message.user_image} >
        <p>${message.user_name}</p>
        <p class="date">${message.created_at}</p>
      </div>
      <div class='message__main'>
        <img src=${message.image} class="message-icon">
        <p class="message__main--text">${message.text}</p>
      </div>
    </div>`
    } else if (message.image) {
      var html = `
      <div class='message'>
        <div class='message__messanger'>
          <img src=${message.user_image} class="message-icon">
          <p>${message.user_name}</p>
          <p class="date">${message.created_at}</p>
        </div>
        <div class='message__main'>
          <p class="message__main--text">${message.text}</p>
        </div>
      </div>`
    } else if (message.text){
      var html= `
    <div class='message'>
      <div class='message__messanger'>
        <img src=${message.user_image} class="message-icon">
        <p>${message.user_name}</p>
        <p class="date">${message.created_at}</p>
      </div>
      <div class='message__main'>
        <p class="message__main--text">${message.text}</p>
      </div>
    </div>`
  };
  return html;
  };

  $('#sending').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "post",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('form')[0].reset();
      $('.messages').animate({ scrollTop: ('.messages')[0].scrollHeight});
      $('input').prop('disabled', false);
    })
    .fail(function() {
      alert('miss!')
      $('input').prop('disabled', false);
    });
  });

  var reloadMessages = function() {
    var last_message_id = $('.message:last').data("message-id");
    $.ajax({
      url: "api/messages",
      type: 'get',
      dataType: "json",
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0){
        var insertHTML = '';
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        // $('.messages').append(insertHTML);
        $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('Error');
    });
  };
  if (document.location.href.match(/\/communities\/\d+\/messages/)) {
    setInterval(reloadMessages, 3000);
  }
});
