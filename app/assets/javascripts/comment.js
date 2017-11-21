$(document).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(comment){
      var html = '<div class = comment_user_name>'+
                 '<p>'+comment.user_name+'</p>'+
                 '</div>'+
                 '<div class = comment_content>'+
                 '<p>'+comment.content+'</p>'+
                 '</div>';
                 // '<div class= action-button>'+
                 //  '<a data-method="delete" href="" rel="nofollow">'+Delete+'</a>'+
                 //  '<a data-method="get" herf="" rel="nofollow">'+Edit+'</a>'+
                 // '</div>';
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
          $('#comment_content').val('')
        })
        .fail(function(){
          alert('error');
      })
    })
  });
});
