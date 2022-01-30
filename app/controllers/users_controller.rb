class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Account created, Now Create your Profile'
      redirect_to new_profile_path
    else
      flash[:notice] = 'Either email already exists in the database or password is too short or password is not matching'
      render :new
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
