$(document).on("turbolinks:load", function() {
    return $('#users-table').dataTable({
      processing: true,
      serverSide: true,
      ajax: $('#users-table').data('source'),
      pagingType: 'full_numbers',
      columns: [
        {
          data: 'id',
          searchable: true,
          orderable: true
        },{
            data: 'name',
            searchable: true,
            orderable: true
          },{
            data: 'password',
            searchable: true,
            orderable: true
          },{
            data: 'role',
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
  