class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.coffee = Coffee.find(params[:coffee_id])
    @like.save
    flash[notice] = 'Café favoritado'
    respond_to do |format|
      format.html { redirect_to coffee_path(@like.coffee) }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(params[:like_id], current_user)
    @coffee = Coffee.find(params[:id])
    @like.destroy
    flash[:notice] = 'Café desfavoritado'
    redirect_to coffee_path(@coffee)
  end

  def toggle
    @like = Like.find_by(coffee_id: params[:coffee_id], user: current_user)
    if @like
      @like.destroy
    else
      @like = Like.new
      @like.user = current_user
      @like.coffee = Coffee.find(params[:coffee_id])
      @like.save
    end
    respond_to do |format|
      format.html { redirect_to coffee_path(@like.coffee) }
      format.js
    end
  end
end
