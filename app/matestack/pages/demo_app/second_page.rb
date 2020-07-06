class Pages::DemoApp::SecondPage < Matestack::Ui::Page

  def response
    components {
      5.times do
        paragraph text: 'Hello, second page!'
      end
    }
  end

end