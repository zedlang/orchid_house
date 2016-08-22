class Admin::ProductsController < Admin::ApplicationController
  before_action :set_product, only: [:edit, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to @product
    else
      flash.now[:alert] = "Product has not been created."
      render "new"
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product has been updated"
      redirect_to @product
    else
      flash.now[:alert] = "Product has not been updated"
      render "edit"
    end 
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
