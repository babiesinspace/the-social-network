Rails.application.routes.draw do
  root to: "profiles#index"
  get '/profiles/:id/edit', to: 'profiles#index'
  # get '/profiles', to: 'profiles#index'
  # get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  # get '/profiles/:id', to: 'profiles#show'


  resources :profiles, only: [:new, :create, :index] do
    resources :posts, only: [:create]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
end
