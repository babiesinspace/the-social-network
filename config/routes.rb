Rails.application.routes.draw do
  root to: 'profiles#index'
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
  get '/logout', to: 'profiles#destroy'
  devise_for :users
end
