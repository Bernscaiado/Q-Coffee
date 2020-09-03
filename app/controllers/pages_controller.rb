class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @coffees = Coffee.all
    @category_roast = Coffee.all.pluck(:roast).uniq
    @category_sensory = Coffee.all.pluck(:sensory).uniq
    @category_taste = Coffee.all.pluck(:taste).uniq
  end
end
