class BasketsController < ApplicationController

  before_action :basket, :only => [:add, :remove, :empty, :show]

  def show
  end

  def add
    @items = @basket.items
    if @items.size > 0
      an_item = @items.find_by(product_id: params[:product_id].to_i)
      if an_item
        an_item.increment(:quantity)
        an_item.save
      else
        @items.create(basket_id: @basket.id, 
        product_id: params[:product_id].to_i, 
        quantity: 1)
      end
    else
      @items.create(basket_id: @basket.id, 
      product_id: params[:product_id].to_i, 
      quantity: 1)
    end

    redirect_to basket_path
  end

  def remove
    @items = @basket.items
    an_item = @items.find_by(product_id: params[:product_id].to_i)
    if an_item
      if an_item.quantity == 1
        an_item.destroy
      else
        an_item.quantity -= 1
        an_item.save
      end
    end

    redirect_to basket_path
  end

  def empty
    @basket.items.each do |item|
      item.destroy
    end

    redirect_to basket_path
  end

  private

  def basket
    @basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
      @basket = Basket.create
      session[:basket_id] = @basket.id
  end
end
