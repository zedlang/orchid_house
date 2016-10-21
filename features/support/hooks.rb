Before ('@view_order') do
  @product = FactoryGirl.create(:product)

  @order = FactoryGirl.create(:order)
  @basket = FactoryGirl.create(:basket, order_id: @order.id)

  @basket.items.create!(product_id: @product.id, quantity: 1)
  @order.update!(basket: @basket)
end