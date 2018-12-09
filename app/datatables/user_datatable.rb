class UserDatatable < AjaxDatatablesRails::ActiveRecord
    extend Forwardable
  
    def initialize(params, opts = {})
      @view = opts[:view_context]
      super
    end
  
    def_delegator :@view, :link_to
    def_delegator :@view, :edit_admin_user_path
    def_delegator :@view, :admin_user_activate_path
  
   
  
  
    def view_columns
      # Declare strings in this format: ModelName.column_name
      # or in aliased_join_table.column_name format
      @view_columns ||= {
        id: { source: "User.id", cond: :eq },
        name: { source: "User.name", cond: :like },
        password: { source: "User.password", cond: :like },
        role: { source: "Role.name", cond: :like },
        status: { source: "User.status", cond: :eq }
      }
    end
  
    def data
      records.map do |record|
        {       
          id: record.id,
          name: record.name,
          password: record.spassword,
          role: record.role.name,
          status: status_show(record),
          actions: link_to('<i class="mdi mdi-table-edit"></i>'.html_safe,edit_admin_user_path(record), data: { turbolinks: false },:class=>'btn btn-warning btn-xs')+'&nbsp;'.html_safe+link_to('<i class="mdi mdi-delete"></i> '.html_safe, [:admin,record], :method => :delete, :class=>'btn btn-danger btn-xs',data: { confirm: 'Are you sure?' })
        }
      end
    end
  
    private
    def get_raw_records
      # insert query here
      User.joins(:role).all
    end
  
    def status_show(record)
      if record.status 
        '<label class="switch">  <input type="checkbox" checked class="activate" data-url='"#{admin_user_activate_path(record)}"'>  <span class="slider round"></span></label>'.html_safe
      else
        '<label class="switch">  <input type="checkbox" class="activate" data-url='"#{admin_user_activate_path(record)}"'>  <span class="slider round"></span></label>'.html_safe
      end
    end
  
  end
  