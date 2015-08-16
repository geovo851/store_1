class StoreController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], :per_page => 10)
    @count_in_cart = Order.where(order: nil).count
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
    @count_in_cart = Order.where(order: nil).count
    @categories = Category.all
  end

  def search_products
    @products = Product.where(category_id: params[:id]).paginate(page: params[:page], :per_page => 10)
    @categories = Category.all
    @category_id = "category_#{params[:id]}"
  end
end
