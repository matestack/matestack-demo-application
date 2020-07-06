class DemoAppController < ApplicationController

  def example_page
    responder_for(Pages::DemoApp::ExamplePage)
  end

end