Rails.application.routes.draw do
  get 'charges/new'

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  get 'users/downgrade'

  root 'welcome#index'
end
