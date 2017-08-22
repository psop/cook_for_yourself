class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_product

  def new
  	@review = Review.new
  end

  def edit
  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
    @review.product_id = @product.id

    if @review.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
  	if @review.update(review_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
  	@review.destroy
  	redirect_to @product
  end

  private

  def find_review
  	@review = Review.find(params[:id])
  end

  def find_product
  	@product = Product.find(params[:product_id])
  end

  def review_params
  	params.require(:review).permit(:rating, :comment)
  end
end
