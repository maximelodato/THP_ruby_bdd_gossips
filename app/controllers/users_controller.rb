# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'User not found.'
  end
end
