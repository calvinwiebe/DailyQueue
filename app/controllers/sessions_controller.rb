class SessionsController < Devise::SessionsController
  
  # POST /resource/sign_in
  #Override
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure" )
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|
      format.html { respond_with resource, :location => redirect_location(resource_name, resource) }
      format.json { render :json => {:success => true, :authenticity_token => form_authenticity_token} }
    end
  end
  
  
  def failure
    unless request.format.to_sym == :html
      render :json => {:success => false}
    else
      redirect_to(new_user_session_path, :alert => "Invalid user name or password")
    end
  end
end