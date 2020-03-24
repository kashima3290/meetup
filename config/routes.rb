Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  namespace :api do
    resources :users, only: :index
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
    resources :parts, only: [:index, :new, :create]
  end
  resource :community do
    resources :boards, only: [:index, :new, :edit, :create, :destroy, :update]
  end
end
