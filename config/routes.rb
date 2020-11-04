Rails.application.routes.draw do
  get 'users/show'
  get 'judges/show'
  root to: 'skills#index'
  devise_for :users
  resources :posts do
    resources :judges, only: [:create,:index]
  end

  resources :skills  do
    resources :compares  
    resources :comments
  end
  resources :users, only: [:show]
end
