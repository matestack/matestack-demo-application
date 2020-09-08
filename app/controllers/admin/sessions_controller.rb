class Admin::SessionsController < Devise::SessionsController
  include Admin::Components::Registry
  
  matestack_app Admin::App
  layout 'administration'

  def new
    render Admin::Pages::Sessions::SignIn
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

end