class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    Rails.logger.debug "User found: #{user.inspect}" # Debug: Affiche les informations de l'utilisateur
  
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie!'
    else
      Rails.logger.debug "Authentication failed for: #{params[:session][:email]}" # Debug
      flash.now[:alert] = 'Email ou mot de passe incorrect.'
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Vous avez été déconnecté.' 
  end
end
