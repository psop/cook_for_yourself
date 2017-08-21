class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def show
  	@product = Product.find(params[:id])
  end
end
