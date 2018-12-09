$(document).on("turbolinks:load", function() {
  return $('#categories-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: $('#categories-table').data('source'),
    pagingType: 'full_numbers',
    columns: [
      {
        data: 'id',
        searchable: true,
        orderable: true
      }, {
        data: 'name',
        searchable: true,
        orderable: true
      }, {
        data: 'status',
        searchable: false,
        orderable: false
      }, {
        data: 'actions',
        searchable: false,
        orderable: false
      }
    ]
  });
});

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