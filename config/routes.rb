Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  get '/notifications', to: 'users#notify'
  get '/acept_friend',  to: 'friendships#update'
  post '/delete_friend', to: 'friendships#destroy'

  resources :users, only: [:index, :show, :notify] do
    resources :friendships, only: [:create, :destroy, :update ]
  end

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
