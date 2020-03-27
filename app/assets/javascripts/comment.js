$(function(){
  function buildHTML(comment){
    var html = `
    <div class='comment w-100 m-2'>
        <img src="${comment.user_image}" class="show-user-icon">
        <a href=/users/${comment.user_id} class="h5 text-primary ml-2" >${comment.user_name} : </a>
        <span class="text-dark h5">${comment.text}</span>
        </div>
    `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').prepend(html);
      $('.textbox').val('');
      $('form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});