$(document).on("turbolinks:load", function() {
    return $('#stores-table').dataTable({
      processing: true,
      serverSide: true,
      ajax: $('#stores-table').data('source'),
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
  