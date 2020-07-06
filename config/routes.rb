Rails.application.routes.draw do
  root to: 'demo_app#first_page'

  get '/first_page', to: 'demo_app#first_page'
  get '/second_page', to: 'demo_app#second_page'
end
