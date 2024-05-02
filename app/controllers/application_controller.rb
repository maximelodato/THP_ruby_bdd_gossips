class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  private

  def logged_in?
    !!current_user
  end

  def authenticate_user!
    unless logged_in?
      flash[:alert] = 'Vous devez être connecté pour poster un commentaire.'
      redirect_to login_path
    end
  end
end
