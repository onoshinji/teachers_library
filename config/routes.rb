Rails.application.routes.draw do
  root to: "posts#index"
  get :about, to: 'posts#about'
  get :worksheet, to: 'posts#worksheets'
  get :findings, to: 'posts#Findings'
  get :plan, to: 'posts#plans'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :favorites, only: [:new, :index, :create, :destroy]
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
