Before ('@view_order, @view_basket') do
  @product = FactoryGirl.create(:product)

  @order = FactoryGirl.create(:order)
  @basket = FactoryGirl.create(:basket, order_id: @order.id)
  page.set_rack_session(basket_id: @basket.id)
  @basket.items.create!(product_id: @product.id, quantity: 1)
  @order.update!(basket: @basket)
end