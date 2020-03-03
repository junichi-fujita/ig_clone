Rails.application.routes.draw do
  root "top#index"
  resources :pictures
  resources :users
  resource :session, only: [:create, :destroy]
end
