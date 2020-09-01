class ReviewsController < ApplicationController
  before_action :set_coffee, only: %i[new create]
  before_action :set_review, only: %i[edit update destroy show]

  def index
    @reviews = Review.where(params[:coffee_id])
  end

  def show
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

  def edit
  end

  def update
    if @review.update(reviews_params)
      redirect_to coffee_path(@review.coffee)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to coffee_path(@review.coffee)
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
