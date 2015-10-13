class ProductsOrdersController < ApplicationController
  # filter_resource_access
  include CurrentCart

  def new
    @products_order = ProductsOrder.new
    @products = Product.all
    @order_id = params[:order_id]
  end

  def create

    if params[:order_id]

      product = Product.find_by(id: params[:products_order][:product_id])
      @order = Order.find(params[:order_id])

      @products_orders = @order.products_orders.find_by(product_id: product.id)
      
      if @products_orders
        @products_orders.quantity += params[:products_order][:quantity].to_f
      else
        @products_orders = @order.products_orders.build(product_id: product.id,
                                     quantity: params[:products_order][:quantity],
                                     price: product.price)
      end
      
      @order.total_sum ||= 0
      @order.total_sum += (product.price * params[:products_order][:quantity].to_f)

      if @products_orders.save && @order.save
        redirect_to order_path(@products_orders.order_id)
      else
        flash[:error] = "Could not add to order."
        render :back
      end

    else

      if user_signed_in?
        set_cart
        @cart.total_sum ||= 0
        @cart.total_sum += params[:price].to_f

        product = Product.find_by(id: params[:product_id])

        @products_orders = @cart.products_orders.find_by(product_id: product.id)
        
        if @products_orders
          @products_orders.quantity += 1
        else
          @products_orders = @cart.products_orders.build(product_id: product.id,
                                       quantity: 1, price: params[:price])
        end

        if @products_orders.save && @cart.save
          redirect_to  store_cart_path(@products_orders.order_id)
        else
          flash[:error] = "Could not add to cart."
          render :back
        end
      else
        flash[:error] = "You need sign in."
        redirect_to new_user_session_path
      end

    end

  end

  def edit
    @products_order = ProductsOrder.find(params[:id])
    @products = Product.all
    @order_id = params[:order_id]
  end

  def update
    product = Product.find_by(id: params[:products_order][:product_id])
    @order = Order.find(params[:order_id])

    @products_order = @order.products_orders.find_by(id: params[:id])
    
    @products_order.quantity = params[:products_order][:quantity].to_f

    @order.total_sum -= @products_order.quantity * @products_order.price
    
    @products_order.price = product.price
    @products_order.quantity = params[:products_order][:quantity].to_f
    @products_order.product_id = product.id
    
    @order.total_sum += @products_order.price * @products_order.quantity

    if @products_order.save && @order.save
      redirect_to order_path(@products_order.order_id)
    else
      flash[:error] = "Could not edit to order."
      render 'edit'
    end
  end

  def update_quantity
    products_order = ProductsOrder.find_by(id: params[:id])
    products_order.quantity = params[:quantity].to_f
    products_order.order.total_sum = params[:total_sum]
    products_order.order.save
    products_order.save
  end

  def destroy
    if params[:order_id]
      @order = Order.find(params[:order_id])
      @order.total_sum ||= 0
      
      @products_order = @order.products_orders.find(params[:id])
      @order.total_sum -= (@products_order.price * @products_order.quantity)
      @order.save
      
      @products_order.destroy

      redirect_to order_path(@order.id)
    else
      set_cart

      @products_order = @cart.products_orders.find(params[:id])
      @cart.total_sum -= (@products_order.price * @products_order.quantity)
      @cart.save
      
      @products_order.destroy

      redirect_to store_cart_path(@cart.id)
    end
  end
end

