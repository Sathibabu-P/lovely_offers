class StoreDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_admin_store_path
  def_delegator :@view, :admin_store_activate_path

 


  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Store.id", cond: :eq },
      name: { source: "Store.name", cond: :like },
      status: { source: "Store.status", cond: :eq }
    }
  end

  def data
    records.map do |record|
      {       
        id: record.id,
        name: record.name,
        status: status_show(record),
        actions: link_to('<i class="mdi mdi-table-edit"></i>'.html_safe,edit_admin_store_path(record), data: { turbolinks: false },:class=>'btn btn-warning btn-xs')+'&nbsp;'.html_safe+link_to('<i class="mdi mdi-delete"></i> '.html_safe, [:admin,record], :method => :delete, :class=>'btn btn-danger btn-xs',data: { confirm: 'Are you sure?' })
      }
    end
  end

  private
  def get_raw_records
    # insert query here
    Store.all
  end

  def status_show(record)
    if record.status  

      '<label class="switch">  <input type="checkbox" checked class="activate" data-url='"#{admin_store_activate_path(record)}"'>  <span class="slider round"></span></label>'.html_safe
    
      
    else

      '<label class="switch">  <input type="checkbox" class="activate" data-url='"#{admin_store_activate_path(record)}"'>  <span class="slider round"></span></label>'.html_safe

      # link_to('<i class="mdi mdi-eye-off"></i> '.html_safe,  admin_store_activate_path(record), data: { turbolinks: false },  :class=>'btn btn-danger btn-xs')+'&nbsp;'.html_safe
    end
  end

end
