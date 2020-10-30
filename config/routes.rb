Rails.application.routes.draw do
  get 'judges/show'
  root to: 'skills#index'
  devise_for :users
  resources :posts do
    resources :judges, only: [:create,:index]
  end

  resources :skills  do
    resources :compares, only: [:create,:index] do
      resources :comments
    end
  end

end
