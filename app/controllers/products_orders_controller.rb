class ProductsOrdersController < ApplicationController
  include CurrentCart

  def create
    if user_signed_in?
      set_cart
      product = Product.find_by(id: params[:product_id])
      @products_orders = @cart.products_orders.build(product_id: product.id,
                                             quantity: 1, price: params[:price])

      if @products_orders.save
        redirect_to  order_path(@products_orders.order_id) #controller: :carts, action: :show, id: @products_orders.order_id
      else
        flash[:error] = "Could not add to cart."
        render :back
      end
    else
      flash[:error] = "You need sign in."
      redirect_to new_user_session_path
    end
  end

  def destroy
    @products_order = ProductsOrder.find(params[:id])
    @products_order.destroy

    set_cart
    redirect_to order_path(@cart.id)
  end

end
