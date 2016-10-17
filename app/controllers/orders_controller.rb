class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def create
    @order = Order.find_or_create_by(basket_id: params[:basket][:basket_id])
    @order.basket = Basket.find(params[:basket][:basket_id])
    
    redirect_to order_path(@order)
  end
end
