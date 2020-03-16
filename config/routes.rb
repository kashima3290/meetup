Rails.application.routes.draw do
  devise_for :users
  root 'communities#index'
  resources :users, only: [:edit, :update, :show]
  resources :communities do
    get 'chat'
    resources :messages, only: [:index, :create]
    resources :boards, only: [:index, :new, :create, :show]
  end
end
