class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.coffee = Coffee.find(params[:coffee_id])
    @like.save
    flash[notice] = 'Café favoritado'
    redirect_to coffee_path(@like.coffee)
  end

  def destroy
    @like = Like.search(params[:like_id], current_user)
    @coffee = Coffee.find(params[:id])
    @like.each do |like|
      like.destroy
    end
    flash[:notice] = 'Café desfavoritado'
    redirect_to coffee_path(@coffee)
  end
end
