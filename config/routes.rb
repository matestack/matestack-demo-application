Rails.application.routes.draw do
  root to: 'persons#index'

  get '/first_page', to: 'demo_app#first_page'
  get '/second_page', to: 'demo_app#second_page'

  resources :persons

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'persons#index'
    resources :persons
  end

end
