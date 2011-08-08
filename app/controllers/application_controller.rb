class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  protected 
  
  def authenticate_admin!
    unless user_signed_in? && current_user.try(:admin?)
      redirect_to(root_path, :notice => "that page does not exist")
    end
  end
  
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    profile_path
  end
  
end
