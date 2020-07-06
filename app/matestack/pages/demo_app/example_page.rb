class Pages::DemoApp::ExamplePage < Matestack::Ui::Page

  def response
    components {
      5.times do
        paragraph text: 'Hello, world!'
      end
    }
  end

end
