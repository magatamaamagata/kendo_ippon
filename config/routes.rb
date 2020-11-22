Rails.application.routes.draw do
  get 'judges/show'
  root to: 'skills#index'
  devise_for :users
  post '/users/guest_sign_in', to: 'users#new_guest'
  resources :posts do
    resources :judges, only: [:new,:create,:show]
  end

  resources :skills  do
    resources :compares
      # , only: [:new,:create,:edit,:update]
    resources :comments
      # , only: [:new,:create]
  end
  resources :users, only: [:edit, :update, :show, :destroy]
end