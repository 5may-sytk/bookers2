class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @user_images = @user.user_images  
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id]) 
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
