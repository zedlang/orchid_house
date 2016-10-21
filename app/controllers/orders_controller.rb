class OrdersController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def create
    @order = Order.find_or_create_by(basket_id: self.basket)
    if @order
      @order.basket = self.basket
      @order.set_status(false)
      @order.set_order_number

      redirect_to order_path(@order)
    else
      flash.now[:alert] = "There was a problem creating your order. Please try again"
      render basket_path
    end
    
  end
end
