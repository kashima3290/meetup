Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  namespace :communities do
    resources :searches, only: :index
  end
  resources :users, only: [:edit, :update, :show]
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
