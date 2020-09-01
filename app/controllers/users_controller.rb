class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]
  skip_before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def follow
    @user = User.find(params[:id])
    if current_user.follow(@user.id)
      redirect_to users_path
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      redirect_to users_path
    end
  end
    
  def show
    @user = User.find(params[:id])
  end

  def edit
    current_user
  end

  def update
    # authorize @user
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :about)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
