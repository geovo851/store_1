class OrdersController < ApplicationController
  include CurrentCart
  # filter_resource_access :attribute_check => true

  def index
    @orders = Order.where(order: true).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @users = User.all
    @payments = Payment.all
  end

  def edit
    @order = Order.find(params[:id])
    @users = User.all
    @payments = Payment.all
  end

  def create
    @order = Order.new(order_params)
    @order.order = true
    if @order.save
      redirect_to orders_path
    else
      @users = User.all
      @payments = Payment.all
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
   
    if @order.update(order_params)
      redirect_to orders_path
    else
      @users = User.all
      @payments = Payment.all
      render 'edit'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
 
    redirect_to orders_path
  end
  
  private
    def order_params
      params.require(:order).permit(:payment_id, :user_id, :delivary_adress, :status)
    end
end
