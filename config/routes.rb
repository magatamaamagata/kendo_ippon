Rails.application.routes.draw do
  get 'judges/show'
  root to: 'posts#index'
  devise_for :users
  resources :posts
  resources :judges, only: [:create,:show]
end
