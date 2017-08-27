Rails.application.routes.draw do
  get 'charges/new'

  devise_for :users

  resources :wikis do
    put :toggle_collaborator
  end

  resources :charges, only: [:new, :create]

  get 'users/downgrade'

  root 'welcome#index'
end
