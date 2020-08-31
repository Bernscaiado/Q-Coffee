class CoffeesController < ApplicationController
  def show
    @coffee = Coffee.find(params[:id])
    @reviews = Review.where(coffee_id: @coffee)
  end

  def category
    @coffee = Coffee.where("origin ILIKE ? OR roast ILIKE ? OR brand ILIKE ? OR sensory ILIKE ?", "%#{params[:format]}%")
  end

  def search
    if params[:query].present?
      @coffee = search_by_all(params[:query])
    else
      @coffee = Coffee.all
    end
  end
end
