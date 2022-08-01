Rails.application.routes.draw do
  resources :moods
  devise_for :users
  root "moods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
