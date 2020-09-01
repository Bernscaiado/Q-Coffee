class CoffeesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show category search]

  def show
    @coffee = Coffee.find(params[:id])
    @reviews = Review.where(coffee_id: @coffee)
    @review = Review.new
    @like = Like.where(user_id: current_user, coffee_id: @coffee)
  end

  def category
    @coffees = Coffee.category_search(params[:query])
  end

  def search
    if params[:query].present?
      @coffees = Coffee.global_search(params[:query])
    else
      @coffees = Coffee.all
    end
  end
end
