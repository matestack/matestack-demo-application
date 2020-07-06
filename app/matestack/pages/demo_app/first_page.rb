class Pages::DemoApp::FirstPage < Matestack::Ui::Page

  def response
    components {
      5.times do
        paragraph text: 'Hello, first page!'
      end
    }
  end

end
