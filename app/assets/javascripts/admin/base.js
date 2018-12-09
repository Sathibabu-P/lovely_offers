$(document).on("turbolinks:load", function() {
    return $(document).on('click', '.activate', function(){
      var url = $(this).data('url');
      return $.ajax({
        type: "GET",
        url: url,
        success: function() {
          return false;
        },
        error: function() {
          return false;
        }
      });    
    });  
  });
