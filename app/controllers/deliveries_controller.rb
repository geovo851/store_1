class DeliveriesController < ApplicationController
  include CurrentCart

  def edit
    set_cart
    @payments = Payment.all
  end

  def update
    set_cart
    @cart.order = true
    @cart.status = 'expect'
    if @cart.update(orders_params)
      message = "Your order is accepted. The manager will call you. Your order №#{@cart.id}"
      flash[:success] = message
      set_cart
     
      redirect_to controller: :store, action: :cart, id: @cart.id
    else
      flash[:error] = "The order is not accepted."
      @payments = Payment.all

      render 'edit'
    end
  end

  private
    def orders_params
      params.require(:order).permit(:payment_id, :delivary_adress)
    end
end
