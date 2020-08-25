class Admin::Pages::Sessions::SignIn < Matestack::Ui::Page

  def response
    div class: 'container my-5' do
      div class: 'row' do
        div class: 'col-md-4 offset-md-4' do
          div class: 'card' do
            div class: 'card-body text-center' do
              heading text: t('devise.sessions.new.login')
              login_form
            end
          end
        end
      end
    end
  end

  private

  def login_form
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
  end

  def form_config
    {
      for: :admin,
      method: :post,
      path: admin_session_path,
      success: { 
        redirect: { 
          follow_response: true 
        } 
      },
      failure: { 
        emit: "login_failure" 
      }
    }
  end

end
