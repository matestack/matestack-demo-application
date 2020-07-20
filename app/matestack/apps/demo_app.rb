class Apps::DemoApp < Matestack::Ui::App

  def prepare
    @persons = Person.all
  end

  def response
    components {
      partial :navigation
      main do
        custom_person_disclaimer
        page_content
      end
    }
  end

  def navigation
    partial {
      header do
        nav class: 'navbar navbar-expand-md navbar-dark bg-dark fixed-top' do
          transition class: 'navbar-brand', path: :root_path, text: 'DemoApp'
          button class: 'navbar-toggler', attributes: { "data-target": "#navbarsExampleDefault", role:"button", "data-toggle": "collapse", "aria-controls": "navbarsExampleDefault", "aria-expanded": "false" } do
            span class: 'navbar-toggler-icon'
          end
          div id: 'navbarsExampleDefault', class: 'collapse navbar-collapse' do
            ul class: 'navbar-nav mr-auto' do
              li class: 'nav-item' do
                transition class: 'nav-link', path: :persons_path, text: 'All persons'
              end
            end
          end
        end
      end
    }
  end

end
