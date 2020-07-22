class Apps::AdminApp < Matestack::Ui::App

  def response
    components {
      partial :navigation if admin_signed_in?
      div id: 'spinner', class: 'spinner-border', role: 'status' do
        span class: 'sr-only', text: 'Loading...'
      end
      main id: 'page-content' do
        page_content
      end
    }
  end

  def navigation
    partial {
      header do
        nav class: 'navbar navbar-expand-md navbar-dark bg-dark fixed-top' do
          transition class: 'navbar-brand', path: :root_path, text: 'AdminApp'
          button class: 'navbar-toggler', attributes: { "data-target": "#navbarsExampleDefault", role:"button", "data-toggle": "collapse", "aria-controls": "navbarsExampleDefault", "aria-expanded": "false" } do
            span class: 'navbar-toggler-icon'
          end
          div id: 'navbarsExampleDefault', class: 'collapse navbar-collapse justify-content-end' do
            ul class: 'navbar-nav mr-0' do
              li class: 'nav-item' do
                transition class: 'nav-link', path: :persons_path, text: 'All persons'
              end
              li class: 'nav-item' do
                action logout_action_config do
                  span class: 'btn-nav btn btn-primary', text: I18n.t('devise.sessions.logout')
                end
              end
            end
          end
        end
      end
    }
  end

  protected

  def logout_action_config
    {
      method: :delete,
      path: :destroy_admin_session_path,
      success: {
        emit: "reload_page",
        transition: {
          follow_response: true
        }
      }
    }
  end

end
