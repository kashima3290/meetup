Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get 'my_page' => 'users/registrations#my_page'
  end
  root 'users#index'
  namespace :api do
    resources :users, only: [:index, :show]
  end
  resources :users, only: [:index, :show, :edit, :update]
  namespace :communities do
    resources :searches, only: :index
  end
  resources :communities do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
    resources :parts, only: [:index, :new, :create, :destroy]
    resources :boards, only: [:new, :create]
  end
  resources :boards, only: [:index, :show, :edit] do
    member do
      get 'search'
    end
    resources :comments, only: :create
  end
  resources :notifications, only: :index
end
