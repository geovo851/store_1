class StoreController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], :per_page => 10)
    @count = Order.where(order: nil).count
  end
  
  def show
    @product = Product.find(params[:id])
    @count = Order.where(order: nil).count
  end
end
