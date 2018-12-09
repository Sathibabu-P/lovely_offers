class Admin::StoresController < Admin::BaseController
  before_action :set_admin_store, only: [:show, :edit, :update, :destroy]

  # GET /admin/stores
  # GET /admin/stores.json
  def index
    # @admin_stores = Store.all
    
    respond_to do |format|
      format.html
      format.json { render json: StoreDatatable.new(params,  view_context: view_context) }
    end

  end

  # GET /admin/stores/1
  # GET /admin/stores/1.json
  def show
  end

  # GET /admin/stores/new
  def new
    @admin_store = Store.new
  end

  # GET /admin/stores/1/edit
  def edit
  end

  # POST /admin/stores
  # POST /admin/stores.json
  def create
    @admin_store = Store.new(admin_store_params)

    respond_to do |format|
      if @admin_store.save
        #  @admin_store.image.attach(params[:image])
        format.html { redirect_to admin_stores_url, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @admin_store }
      else
        format.html { render :new }
        format.json { render json: @admin_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stores/1
  # PATCH/PUT /admin/stores/1.json
  def update
    respond_to do |format|
      if @admin_store.update(admin_store_params)
        format.html { redirect_to admin_stores_url, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_store }
      else
        format.html { render :edit }
        format.json { render json: @admin_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stores/1
  # DELETE /admin/stores/1.json
  def destroy
    @admin_store.destroy
    respond_to do |format|
      format.html { redirect_to admin_stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    @admin_store = Store.find(params[:store_id])
    @admin_store.update_attribute(:status, !@admin_store.status)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_store
      @admin_store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_store_params
      params.require(:store).permit(:name, :description, :order, :status, :image,:preview,category_ids: [])
    end
end
