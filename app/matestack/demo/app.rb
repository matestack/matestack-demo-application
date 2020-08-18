class Demo::App < Matestack::Ui::App

  def prepare
    @persons = Person.all
  end

  def response
    navigation
    div id: 'spinner', class: 'spinner-border', role: 'status' do
      span class: 'sr-only', text: 'Loading...'
    end
    main id: 'page-content' do
      person_disclaimer
      page_content
    end
  end

  private

  def navigation
    nav class: 'navbar navbar-expand-md bg-white fixed-top' do
      transition class: 'navbar-brand font-weight-bold', path: :root_path, text: 'DemoApp'
      navbar_button
      div id: 'navbarsExampleDefault', class: 'collapse navbar-collapse' do
        ul class: 'navbar-nav mr-auto' do
          li class: 'nav-item' do
            transition class: 'nav-link text-dark', path: :persons_path, text: 'Persons'
          end
          li class: 'nav-item' do
            transition class: 'nav-link text-dark', path: :persons_path, text: 'New'
          end
          li class: 'nav-item' do
            link class: 'nav-link text-secondary', path: :new_admin_session_path, text: 'Login'
          end
        end
      end
    end
  end

  def navbar_button
    button(
      class: 'navbar-toggler',
      role: :button,
      data: { target: '#navbar-example-default', toggle: :collapse }, 
      attributes: { "aria-controls": "navbarsExampleDefault", "aria-expanded": "false" }
    ) do
      span class: 'navbar-toggler-icon'
    end
  end

end