class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    @cart = cart.find(params[:id])
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
    name = (0...8).map { (65 + rand(26)).chr }.join
    u = User.create(name: name)
    @cart = Cart.create(user_id: u.id)
    p = CartPosition.create(good_id: params[:id], quantity: 1, price: params[:price])
    @cart.cart_positions << p
    @cart.save
    redirect_to goods_path
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
    # @good = Good.find(params[:id])
    # @good.destroy
 
    # redirect_to goods_path
  end
  
  private
    def good_params
      # params.require(:good).permit(:name, :photo, :description, :category_id, 
      #                              :price)
    end
end
