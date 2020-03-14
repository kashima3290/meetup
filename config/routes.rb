Rails.application.routes.draw do
  devise_for :users
  root 'communities#index'
  resources :users, only: [:edit, :update, :show]
  resources :communities do
    get 'chat'
  end
end
