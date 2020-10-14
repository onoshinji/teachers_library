Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "posts#index"
  resources :favorites, only: [:new, :index, :create, :destroy]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    member do
      get :download
      get :file_download
    end
  end

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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
