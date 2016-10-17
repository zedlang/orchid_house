Before ('@view_order') do
  @product = FactoryGirl.create(:product)

  @order = FactoryGirl.create(:order)
  @basket = FactoryGirl.create(:basket, order_id: @order.id)
  @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 1)
  @order.basket_id = @basket.id
  @order.basket = @basket
end