class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def show
  	@product = Product.find(params[:id])
  end

  def add_to_cart
  	@product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "#{@product.title} has been put in the cart!"
    else
      flash[:warning] = "You already have this item."
    end

    redirect_to :back
  end
end
