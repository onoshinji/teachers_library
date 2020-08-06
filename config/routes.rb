Rails.application.routes.draw do
  root to: "posts#index"
  get :worksheet, to: 'posts#worksheets'
  get :findings, to: 'posts#Findings'
  get :plan, to: 'posts#plans'
  devise_for :users
  resources :favorites, only: [:new, :index, :create, :destroy]
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
