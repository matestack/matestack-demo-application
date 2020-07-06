class PersonsController < ApplicationController

  def index
    responder_for(Pages::DemoApp::Persons::Index)
  end

  def show
  	@person = Person.find_by(id: params[:id])
    responder_for(Pages::DemoApp::Persons::Show)
  end

end