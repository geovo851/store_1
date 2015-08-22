class StoreController < ApplicationController
  include CurrentCart

 filter_access_to :all

  def index
    # @products = Product.paginate(page: params[:page], :per_page => 10)
    @products = Product.page(params[:page]).per(10)
    @categories = Category.all
    
    if user_signed_in?
      set_cart
      @count_in_cart = @cart.products_orders.count
    end

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @product = Product.find(params[:id])
    if user_signed_in?
      set_cart
      @count_in_cart = @cart.goods_orders.count
    end
    @categories = Category.all
  end

  def search_products
    # @products = Product.where(category_id: params[:id]).paginate(page: params[:page], :per_page => 10)
    @products = Product.where(category_id: params[:id]).page(params[:page]).per_page(10)

    @categories = Category.all
    @category_id = "category_#{params[:id]}"

    respond_to do |format|
      format.html
      format.js {}
    end
  end
end
