class CartsController < ApplicationController
  # filter_resource_access
  
  def index
    @carts = Order.where(order: false).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @cart = Order.find(params[:id])
  end
end
