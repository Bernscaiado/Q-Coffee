class CoffeesController < ApplicationController
  def show
    @coffee = Coffee.find(params[:id])
    @reviews = Review.where(coffee_id: @coffee)
    @review = Review.new
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
