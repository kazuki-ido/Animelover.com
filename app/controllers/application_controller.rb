class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  
  
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image, :birthday])
  end
  
  def set_search
    @search = Post.ransack(params[:q])
  end
end
