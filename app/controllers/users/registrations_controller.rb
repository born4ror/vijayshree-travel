class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  before_filter :configure_permitted_parameters


  def new
    super
  end


  def create
    build_resource(sign_up_params)
    if resource.save
      set_flash_message :notice, :signed_up if is_navigational_format?
      sign_up(resource_name, resource)
      redirect_to root_url    
    else
      clean_up_passwords resource
      render text: "$('.registerForm, #overley').hide(); alert('User Registration failed.');"
    end
  end

  protected
  def after_update_path_for resource
    edit_user_registration_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation,:current_password)
    end
  end

  def after_sign_up_path_for(resource)
    root_path
  end

end