Rails.application.routes.draw do
  get 'judges/show'
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    resources :judges, only: [:create,:index]
  end
  resources :skills
  resources :compares, only: [:create,:index] do
    resources :comments
  end
end
