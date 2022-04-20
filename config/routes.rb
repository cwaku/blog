Rails.application.routes.draw do
  devise_for :users
  #get 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: %i[index show create new] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end

end
