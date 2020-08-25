class DemoController < ApplicationController
  
  matestack_app Demo::App

  def first_page
    render Demo::Pages::FirstPage
  end

  def second_page
    render Demo::Pages::SecondPage
  end

end