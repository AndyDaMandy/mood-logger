Rails.application.routes.draw do
  get 'home/index'
  devise_for :views
  resources :moods
  devise_for :users
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
