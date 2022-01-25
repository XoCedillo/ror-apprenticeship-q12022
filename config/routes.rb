Rails.application.routes.draw do
  resources :types
  resources :abilities
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
end
