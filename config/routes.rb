Rails.application.routes.draw do
  get 'judges/show'
  root to: 'skills#index'
  devise_for :users
  resources :posts do
    resources :judges, only: [:create,:index]
  end

  resources :skills  do
    resources :compares  , only: [:new,:create,:edit,:update]
    resources :comments  , only: [:new,:create]
  end
  resources :users, only: [:edit, :update, :show]
end
