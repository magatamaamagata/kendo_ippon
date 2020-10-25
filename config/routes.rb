Rails.application.routes.draw do
  get 'judges/show'
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    resources :judges, only: [:create,:index]
  end
end
