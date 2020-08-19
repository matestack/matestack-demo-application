class Demo::App < Matestack::Ui::App

  def response
    navigation
    div id: 'spinner', class: 'spinner-border', role: 'status' do
      span class: 'sr-only', text: 'Loading...'
    end
    main id: 'page-content' do
      person_disclaimer
      page_content
    end
    footer
  end

  private

  def navigation
    nav class: 'navbar navbar-expand-md navbar-light bg-white fixed-top' do
      transition class: 'navbar-brand font-weight-bold text-primary', path: root_path, text: 'DemoApp'
      navbar_button
      div id: 'navbar-default', class: 'collapse navbar-collapse' do
        ul class: 'navbar-nav mr-auto' do
          li class: 'nav-item' do
            transition class: 'nav-link text-dark', path: persons_path, text: 'Persons'
          end
          li class: 'nav-item' do
            transition class: 'nav-link text-dark', path: new_person_path, text: 'New'
          end
          li class: 'nav-item' do
            link class: 'nav-link text-secondary', path: new_admin_session_path, text: 'Login'
          end
        end
      end
    end
  end

  def navbar_button
    button(
      class: 'navbar-toggler text-dark',
      role: :button,
      attributes: { 
        "aria-controls": "navbar-default",
        "aria-expanded": "false",
        data: { target: '#navbar-default', toggle: :collapse }, 
      }
    ) do
      span class: 'navbar-toggler-icon text-dark'
    end
  end

  def footer
    div class: 'jumbotron jumbotron-fluid bg-light mb-0 footer' do
      div class: 'container py-5' do
        div class: 'd-flex align-items-center justify-content-center' do
          heading class: 'm-0 mr-1 font-weight-normal', size: 5, 
            text: 'This demo application and corresponding guides are provided by'
          img path: asset_path('matestack'), height: '48px'
        end
      end
    end
  end

end