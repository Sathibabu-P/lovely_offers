class Admin::TopBrandsController < Admin::BaseController
  def index
    @admin_top_brands = Store.topbrand.order(:sort).all   
  end

  def new
    @admin_top_brand = Store.new  
  end

  def create
    @store = Store.find(params[:store][:name].to_i)
    if @store
      @last_top_brand =  Store.topbrand.order(:sort).last 
      sort = (@last_top_brand.present?) ? @last_top_brand.sort.to_i+1 : 1
      params = {topbrand: true,sort: sort }
      @store.assign_attributes(params)
      @store.save(validate: false)
    end
    redirect_to admin_top_brands_url
  end

  def set_order
    @lists = params[:list]
    stores = []
    @lists.each_with_index  do |list,index|
      stores.push({id:list.to_i, order: index+1})
    end    
    @admin_top_brands = Store.reorder(stores)
    render json: true
  end  

  def destroy    
    @store = Store.find(params[:id])       
    if @store
      stores = []
      params = {topbrand: false,sort: nil }
      @store.assign_attributes(params)
      @store.save(validate: false)
      @stores = Store.topbrand.order(:sort).all
      @stores.each_with_index  do |list,index|
        stores.push({id: list.id, order: index+1})
      end    
      @admin_top_brands = Store.reorder(stores)
    end
    respond_to do |format|
      format.html { redirect_to admin_top_brands_url, notice: 'Top Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
