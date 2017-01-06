Rails.application.routes.draw do
  root to: "profiles#index"

  resources :profiles, only: [:show, :index, :edit, :update] do
    #add custom route for profiles/search
    resources :posts, only: [:index, :create, :destroy]
    resources :friendships, only: [:index, :create, :destroy]
    resources :friend_requests, only: [:index, :create, :destroy]

  end

  devise_for :users, :controllers => {:registrations => "registrations"}
end
