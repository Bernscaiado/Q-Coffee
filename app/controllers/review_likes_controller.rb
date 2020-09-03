class ReviewLikesController < ApplicationController

  def toggle
    @review = Review.find(params[:review_id])
    @review_like = ReviewLike.find_by(params[:review_like_id], current_user)
    @coffee = @review.coffee
    if @review_like
      @review_like.destroy
    else
      @review_like = ReviewLike.new
      @review_like.user = current_user
      @review_like.review = Review.find(params[:review_id])
      @review_like.save
    end
    respond_to do |format|
      format.html { redirect_to coffee_path(@coffee) }
      format.js
    end
  end

  # def create
  #   @review_like = ReviewLike.new
  #   @review_like.user = current_user
  #   @review_like.review = Review.find(params[:review_id])
  #   @review_like.save!
  #   flash[notice] = 'Review curtida'
  #   redirect_to coffee_path(@review_like.coffee)
  # end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review_like = ReviewLike.find_by(params[:review_like_id], current_user)
  #   @coffee = @review.coffee
  #   @review_like.destroy
  #   flash[:notice] = 'Café desfavoritado'
  #   redirect_to coffee_path(@coffee)
  # end
end
