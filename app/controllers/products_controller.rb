class ProductsController < ApplicationController


  def index
    if params[:query].present?
      @products = Product.search(params[:query]).records
      if @products.size == 0
        flash.now[:notice] = "No search results matched your query"
        render "search_results"
      else
        render "search_results"
      end
    else  
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
