Rails.application.routes.draw do

  devise_for :users
  root to: 'profiles#index'
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
end
