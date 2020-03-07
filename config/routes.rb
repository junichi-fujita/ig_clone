Rails.application.routes.draw do
  root "tops#top"
  resources :pictures do
    patch "like", "unlike", on: :member
    get "voted", on: :collection
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update] do
    get "like_pictures", on: :collection
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
