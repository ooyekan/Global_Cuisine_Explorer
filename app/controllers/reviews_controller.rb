# app/controllers/reviews_controller.rb

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @country = Country.find(params[:country_id])
    @review = @country.reviews.build(review_params)

    if @review.save
      redirect_to @country, notice: 'Review was successfully created.'
    else
      render 'countries/show' # or wherever your form is rendered
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:reviewer_name, :content, :rating, :image, :country_id)
  end
end
