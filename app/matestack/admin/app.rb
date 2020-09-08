class Admin::App < Matestack::Ui::App

  def response
    navigation
    notifications
    main id: 'page-content' do
      yield_page slots: { loading_state: loading_state_element }
    end
    footer
  end

  private

  def navigation
    nav class: 'navbar navbar-expand-md navbar-dark bg-dark fixed-top' do
      transition class: 'navbar-brand font-weight-bold', path: admin_root_path, text: 'AdminApp', delay: 300
      if admin_signed_in?
        navbar_toggle_button
        div id: 'navbar', class: 'collapse navbar-collapse justify-content-end' do
          div class: 'w-100' do
            navbar_right
          end
          navbar_left
        end
      end
    end
  end

  def navbar_toggle_button
    button class: 'navbar-toggler', attributes: { 
      "data-target": "#navbar", role:"button", "data-toggle": "collapse", 
      "aria-controls": "navbar", "aria-expanded": "false" 
    } do
      span class: 'navbar-toggler-icon'
    end
  end

  def navbar_right
    ul class: 'navbar-nav mr-0' do
      li class: 'nav-item' do
        transition class: 'nav-link text-light', path: admin_persons_path, text: 'All persons', delay: 300
      end
    end
  end

  def navbar_left
    ul class: 'navbar-nav mr-0' do
      li class: 'nav-item' do
        link class: 'nav-link text-light mr-3', path: persons_path, text: 'Demo App', delay: 300
      end
      li class: 'nav-item' do
        action logout_action_config do
          span class: 'btn-nav btn btn-primary', text: I18n.t('devise.sessions.logout')
        end
      end
    end
  end

  def loading_state_element
    slot do
      div id: 'spinner', class: 'spinner-border', role: 'status' do
        span class: 'sr-only', text: 'Loading...'
      end
    end
  end

  def footer
    div class: 'jumbotron jumbotron-fluid bg-dark mb-0 footer' do
      div class: 'container py-5' do
        div class: 'd-flex align-items-center justify-content-center' do
          heading class: 'm-0 mr-1 font-weight-normal text-light', size: 5, 
            text: 'This demo application and corresponding guides are provided by'
          img path: asset_path('matestack.png'), height: '48px'
        end
      end
    end
  end

  def logout_action_config
    {
      method: :get,
      path: destroy_admin_session_path,
      success: {
        redirect: {
          follow_response: true
        }
      }
    }
  end

end
