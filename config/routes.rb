Rails.application.routes.draw do
  resources :user, only: :index
end
