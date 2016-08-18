Rails.application.routes.draw do
  resources :rents
  devise_for :users
  resources :movies

  root 'movies#index'
end
