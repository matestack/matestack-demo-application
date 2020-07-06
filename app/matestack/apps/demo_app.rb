class Apps::DemoApp < Matestack::Ui::App

  def response
    components {
      header do
        heading size: 1, text: 'Demo App'
        transition path: :first_page_path, text: 'First page'
        br
        transition path: :second_page_path, text: 'Second page'
      end
      main do
        page_content
      end
    }
  end

end
