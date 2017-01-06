Rails.application.routes.draw do
  root to: 'profiles#index'
  # get '/profiles', to: 'profiles#index'
  # get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  # get '/profiles/:id', to: 'profiles#show'
  get '/logout', to: 'profiles#destroy'

  resources :profiles, only: [:new, :create, :index, :edit] do
    resources :posts, only: [:create]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
end
