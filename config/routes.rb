Rails.application.routes.draw do
  # root 'pages#hello'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], module: :users
  end
  
  resources :posts, only: [:show], module: :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end