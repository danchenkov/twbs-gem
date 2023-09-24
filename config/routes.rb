Rails.application.routes.draw do
  get 'users/profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :about, only: [:index]
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  get '/u/:id', to: "users#profile", as: 'user'

  get :about, to: "about#index"
  resources :posts

  # Defines the root path route ("/")
  root "about#home"
end
