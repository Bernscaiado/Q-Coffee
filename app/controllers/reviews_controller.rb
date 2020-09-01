class ReviewsController < ApplicationController
  before_action :set_coffee, only: %i[index create edit update]
  before_action :set_review, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @reviews = Review.where(coffee_id: @coffee)
  end

  def new
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(reviews_params)
    @review.coffee = @coffee
    @review.user = @user
    if @review.save
      redirect_to coffee_path(@coffee)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(reviews_params)
      redirect_to coffee_path(@coffee)
    else
      render :edit
    end
  end

  def destroy
    @coffee = @review.coffee
    @review.destroy
    redirect_to coffee_path(@coffee)
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end

  def set_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
