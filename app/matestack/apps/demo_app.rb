class Apps::DemoApp < Matestack::Ui::App

  def prepare
    @persons = Person.all
  end

  def response
    components {
      header do
        heading size: 1, text: 'Demo App'
        transition path: :first_page_path, text: 'First page'
        br
        transition path: :second_page_path, text: 'Second page'
        br
        transition path: :persons_path, text: 'All persons'
        hr
      end
      main do
        page_content
      end
    }
  end

end
