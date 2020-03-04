Rails.application.routes.draw do
  root "tops#top"
  resources :pictures
  resources :users
  resource :session, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
