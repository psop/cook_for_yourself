class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def show
  end

  def new
  	@product = Product.new
    @photo = @product.build_photo
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  	  redirect_to admin_products_path
  	else
  	  render :new
  	end
  end

  def edit
    if @product.photo.present?
      @photo = @product.photo
    else
      @photo = @product.build_photo
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
  	params.require(:product).permit(:title, :description, :quantity, :price, photo_attributes: [:image, :id])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
