Rails.application.routes.draw do
  devise_for :users
  root 'communities#index'
  resources :communities, only: [:index, :new]
end
