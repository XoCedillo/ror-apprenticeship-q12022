Rails.application.routes.draw do
  
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  
  devise_for :users
  resources :types
  resources :abilities
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
