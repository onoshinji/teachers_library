Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users
  resources :users
  resources :favorites, only: [:new, :show, :index, :create, :destroy]
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
