Rails.application.routes.draw do
  root to: 'profiles#index'
  # get '/profiles', to: 'profiles#index'
  # get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  # get '/profiles/:id', to: 'profiles#show'
  get '/logout', to: 'profiles#destroy'

  resources :profiles, only: [:show, :index, :edit] do
    #add custom route for profiles/search
    resources :posts, only: [:index, :create, :destroy]
    resources :friendships, only: [:index, :create, :destroy]
    resources :friend_requests, only: [:index, :create, :destroy]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
end
