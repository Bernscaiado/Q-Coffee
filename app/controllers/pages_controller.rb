class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_coffee, only: [:roast, :sensory, :taste]

  def home; end

  def roast
    @category_roast = Coffee.all.pluck(:roast).uniq
  end

  def sensory
    @category_sensory = Coffee.all.pluck(:sensory).uniq
  end

  def taste
    @category_taste = Coffee.all.pluck(:taste).uniq
  end

  private

  def set_coffee
    @coffees = Coffee.all
  end
end
