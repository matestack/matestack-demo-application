class Admin::SessionsController < Devise::SessionsController
  include Admin::Components::Registry
  matestack_app Admin::App
  
  layout 'administration'

  def new
    render Admin::Pages::Sessions::SignIn
  end

  def create
    self.resource = warden.authenticate(auth_options)
    return render json: {}, status: 401 unless resource
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to new_admin_session_path, status: :see_other #https://api.rubyonrails.org/classes/ActionController/Redirecting.html
  end

  private

end