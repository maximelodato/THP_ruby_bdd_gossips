class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Inscription réussie !"
    else
      render :signup, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end


end
