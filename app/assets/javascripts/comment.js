$(function(){
  function buildHTML(comment){
    var html = `<div class = "comment_user_name>
                <p>${ comment.user_name }</p>
                </div>
                <div class = "comment_content>
                <p>${ comment.content }</p>
                </div>`
    return html;
  }
    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = window.location.href + '/comments'

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
        $('.proto-comments').append(html)
        $('#comment-content').val('')
      })
      .fail(function(){
        alert('error');
    })
  })
});
