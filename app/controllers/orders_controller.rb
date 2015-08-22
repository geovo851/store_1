class OrdersController < ApplicationController
  # filter_resource_access
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  # # /goods/new GET
  # def new
  #   @good = Good.new
  # end

  # def edit
  #   @good = Good.find(params[:id])
  # end

  def create
    # i = params[:good]
    # puts '-------------------------'
    # puts '-------------------------'
    # puts i
    # render inline: "<%= #{params}%>"


    # if user_signed_in?
    #   redirect_to new_user_session_path
    # else
    #   flash[:error] = "You need sign in."
    #   redirect_to new_user_session_path
    # end


    # name = (0...8).map { (65 + rand(26)).chr }.join
    # u = User.create(name: name)
    # @cart = Order.create(user_id: u.id)
    # p = ProductsOrder.create(product_id: params[:id], quantity: 1, price: params[:price])
    # @cart.products_orders << p
    # @cart.save
    # redirect_to products_path
  end

  def update
    # @good = Good.find(params[:id])
   
    # if @good.update(good_params)
    #   redirect_to @good
    # else
    #   render 'edit'
    # end
  end
  
  def destroy
    # @order = Order.find(params[:id])
    # @good.destroy
 
    # redirect_to orders_path
  end
  
  private
    def good_params
      # params.require(:good).permit(:name, :photo, :description, :category_id, 
      #                              :price)
    end
end
