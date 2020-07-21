Rails.application.routes.draw do
  devise_for :admins
  root to: 'persons#index'

  get '/first_page', to: 'demo_app#first_page'
  get '/second_page', to: 'demo_app#second_page'

  resources :persons

end
