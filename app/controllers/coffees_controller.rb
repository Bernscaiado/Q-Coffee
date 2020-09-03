class CoffeesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show category search]
  before_action :set_coffee, only: %i[show edit update destroy]

  def index
    @coffees = Coffee.all
    #@coffees = Coffee.where(user: current_user)
  end

  def show
    @reviews = Review.where(coffee_id: @coffee)
    @review = Review.new
    @like = Like.where(user_id: current_user, coffee_id: @coffee)
  end

  def new
    @coffee = Coffee.new
  end

  def my_coffee
    @like = Like.where(user_id: current_user)
    @coffes = @like.coffee
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.user = current_user
    if @coffee.save
      redirect_to coffee_path(@coffee)
    else
      render :new
    end
  end

  def edit; end

  def update
    if coffee.update(coffee_params)
      redirect_to coffee_path(@coffee)
    else
      render :edit
    end
  end

  def destroy
    @coffee.destroy
    redirect_to user_path(current_user)
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

  def liked_coffees
    @user = User.find(params[:id])
    @likes = Like.where(user: @user)
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :brand, :origin,
                                   :farm, :roast, :sensory)
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end
end
