class Apps::DemoApp < Matestack::Ui::App

  def response
    components {
      header do
        heading size: 1, text: "Demo App"
      end
      main do
        page_content
      end
    }
  end

end
