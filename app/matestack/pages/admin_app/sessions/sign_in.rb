class Pages::AdminApp::Sessions::SignIn < Matestack::Ui::Page

  def response
    components {
      section do
        div class: 'container' do
          div class: 'row' do
            div class: 'col-md-4 offset-md-4' do
              div class: 'card' do
                div class: 'card-body text-center' do
                  heading text: t('devise.sessions.new.login')
                  partial :login_form
                end
              end
            end
          end
        end
      end
    }
  end

  private

  def login_form
    partial {
      form form_config, :include do
        div class: 'form-group row' do
          label class: 'col-sm-12 col-form-label col-form-label-md', text: t('devise.sessions.new.email')
          div class: 'col-sm-12' do
            form_input key: :email, type: :text
          end
        end
        div class: 'form-group row' do
          label class: 'col-sm-12 col-form-label col-form-label-md', text: t('devise.sessions.new.password')
          div class: 'col-sm-12' do
            form_input key: :password, type: :password
          end
        end
        form_submit class: 'text-center d-block' do
          button class: 'btn btn-primary text-center', text: I18n.t('devise.sessions.new.login')
        end
      end
      # custom_snackbar text: I18n.t('administration.sessions.new.login_failed'), show_on: "login_failed", hide_after: 5000
    }
  end

  def form_config
    {
      for: :admin,
      method: :post,
      path: :admin_session_path,
      success: { emit: "reload_page", transition: { follow_response: true } },
      failure: { emit: "login_failed" }
    }
  end

end
