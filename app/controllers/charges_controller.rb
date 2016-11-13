class ChargesController < ApplicationController

def new
  @order = Order.find(params[:order_id].to_i)
  @total = @order.basket.total
end

def create
  # Amount in pence
  @total = @order.basket.total

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @total,
    :description => 'Orchid House Customer',
    :currency    => 'gbp'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
