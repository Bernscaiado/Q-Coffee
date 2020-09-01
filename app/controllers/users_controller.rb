class UsersController < ApplicationController
  skip_before_action :authenticate_user!
    
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

end
