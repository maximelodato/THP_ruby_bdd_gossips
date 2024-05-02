class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  
end


private

def authenticate_user!
  unless current_user
    redirect_to login_path, alert: "Veuillez vous connecter pour continuer."
  end
end


