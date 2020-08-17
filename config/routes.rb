Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "posts#index"
  get :about, to: 'posts#about'
  get :worksheets, to: 'posts#worksheets'
  get :findings, to: 'posts#findings'
  get :plans, to: 'posts#plans'
  # デバイスルーティング
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :favorites, only: [:new, :index, :create, :destroy]
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  

end
