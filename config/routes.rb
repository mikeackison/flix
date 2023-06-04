Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "movies#index"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies


  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resources :genres
  resource :session, only: [:new, :create, :destroy]
  resources :users
  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
