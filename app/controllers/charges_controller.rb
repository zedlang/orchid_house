class ChargesController < ApplicationController

def new

  @total = params[:total]
  binding.pry
end

def create
  # Amount in pence
  @total = Basket.total

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
