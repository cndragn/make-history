Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'

  root 'home#index'

  resources :entries

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
