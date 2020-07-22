class Admin::SessionsController < Devise::SessionsController
  layout 'administration'
  before_action :configure_sign_in_params, only: [:create]

  def new
    responder_for(Pages::AdminApp::Sessions::SignIn)
  end

  def create
    errors = {}
    [:email, :password].each do |key|
      errors[key] = ["Can't be blank"] if params[:admin][key].blank?
    end
    if errors.empty?
      admin = warden.authenticate(auth_options)
      sign_in(:admin, admin)
      redirect_to admin_persons_path
    else
      render json: {errors: errors}, status: :unprocessable_entity
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to new_admin_session_path, status: :see_other #https://api.rubyonrails.org/classes/ActionController/Redirecting.html
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

end
