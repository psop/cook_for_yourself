class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def show
  	@product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
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
