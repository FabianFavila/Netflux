Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :rents

  root 'movies#index'
end
