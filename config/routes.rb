Rails.application.routes.draw do
  root "tops#top"
  resources :pictures
  resources :users
  resource :session, only: [:create, :destroy]
end
