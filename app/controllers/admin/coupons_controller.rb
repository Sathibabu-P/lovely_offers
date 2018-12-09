class Admin::CouponsController < Admin::BaseController
  before_action :set_admin_coupon, only: [:show, :edit, :update, :destroy]

  # GET /admin/coupons
  # GET /admin/coupons.json
  def index
    # @admin_coupons = Coupon.all
    
    respond_to do |format|
      format.html
      format.json { render json: CouponDatatable.new(params,  view_context: view_context) }
    end

  end

  # GET /admin/coupons/1
  # GET /admin/coupons/1.json
  def show
  end

  # GET /admin/coupons/new
  def new
    @admin_coupon = Coupon.new
  end

  # GET /admin/coupons/1/edit
  def edit
  end

  # POST /admin/coupons
  # POST /admin/coupons.json
  def create
    @admin_coupon = Coupon.new(admin_coupon_params)

    respond_to do |format|
      if @admin_coupon.save
        #  @admin_coupon.image.attach(params[:image])
        format.html { redirect_to admin_coupons_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_coupon }
      else
        format.html { render :new }
        format.json { render json: @admin_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/coupons/1
  # PATCH/PUT /admin/coupons/1.json
  def update
    respond_to do |format|
      if @admin_coupon.update(admin_coupon_params)
        format.html { redirect_to admin_coupons_url, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_coupon }
      else
        format.html { render :edit }
        format.json { render json: @admin_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/coupons/1
  # DELETE /admin/coupons/1.json
  def destroy
    @admin_coupon.destroy
    respond_to do |format|
      format.html { redirect_to admin_coupons_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    @admin_coupon = Coupon.find(params[:coupon_id])
    @admin_coupon.update_attribute(:status, !@admin_coupon.status)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_coupon
      @admin_coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_coupon_params
      params.require(:coupon).permit(:name, :description, :code, :status, :url,:store_id)
    end
end
