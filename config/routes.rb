Rails.application.routes.draw do
  devise_for :users
  #get 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
      resources :comments, only: [:index, :show, :create, :update, :destroy]
      resources :likes, only: [:index, :show, :create, :update, :destroy]
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: %i[index show create new destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end

end
