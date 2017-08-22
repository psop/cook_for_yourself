class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @item.product
    @item.destroy

    flash[:warning] = "#{@product.title} has been deleted successfully."
    redirect_to :back
  end
end
