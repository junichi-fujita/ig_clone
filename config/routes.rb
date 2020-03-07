Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  root "tops#top"
  resources :pictures
  resources :users
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
