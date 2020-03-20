Rails.application.routes.draw do
  devise_for :users
  root 'communities#index'
  resources :users, only: [:edit, :update, :show]
  resources :communities do
    resources :messages, only: [:index, :create]
    resources :boards, only: [:index, :new, :edit, :create, :show, :destroy]
    resources :parts, only: [:index, :create, :destroy]
  end
end
