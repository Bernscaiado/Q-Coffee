class ReviewLikesController < ApplicationController
  def create
    @review_like = ReviewLike.new
    @review_like.user = current_user
    @review_like.review = Review.find(params[:review_id])
    @review_like.save!
    flash[notice] = 'Review curtida'
    redirect_to coffee_path(@review_like.coffee)
  end

  def destroy
    @review = Review.find(params[:id])
    @review_like = ReviewLike.search(params[:review_like_id], current_user)
    @coffee = @review.coffee
    @review_like.each do |like|
      like.destroy
    end
      flash[:notice] = 'Café desfavoritado'
      redirect_to coffee_path(@coffee)
  end
end
