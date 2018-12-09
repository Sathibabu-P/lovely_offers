$(function() {   

    $('#sortable').sortable({
        update: function(event, ui) {
            var list = $(this).sortable('toArray');
            return $.ajax({
                type: "POST",
                url: '/cms/top_brands/set_order',
                data: {
                    list:list
                },
                success: function() {
                   location.reload();
                },
                error: function() {
                    location.reload();
                }
              });    
            // alert(question_list);
            //this will give you the new order list from here you can fire ajax call for updating the order
        }
    });


    // $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });