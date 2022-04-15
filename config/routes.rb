Rails.application.routes.draw do
  #get 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  #   resources :posts, only: [:index, :show, :create, :new ] do
  #     resources :comments, only: [:create, :new]
  #     resources :likes, only: [:create]
  #   end
  # end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new]
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create]
  end

end
