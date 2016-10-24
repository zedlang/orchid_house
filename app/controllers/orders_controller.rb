class OrdersController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def create
    if self.basket.total == 0
      flash[:alert] = "You cannot place an order if your basket is empty!"
      redirect_to basket_path and return
    end

    @order = Order.find_or_create_by(basket_id: self.basket.id)
    if @order
      @order.update_attribute(:status, @order.set_status(false))
      @order.update_attribute(:order_no, @order.set_order_number)

      redirect_to order_path(@order)
    else
      flash.now[:alert] = "There was a problem creating your order. Please try again"
      render :template => "baskets/show"
    end
    
  end
end
