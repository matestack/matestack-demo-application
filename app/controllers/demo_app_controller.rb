class DemoAppController < ApplicationController

  def first_page
    responder_for(Pages::DemoApp::FirstPage)
  end

  def second_page
    responder_for(Pages::DemoApp::SecondPage)
  end

end