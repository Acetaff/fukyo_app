Rails.application.routes.draw do
  devise_for :users
  root to: "fukyos#index"
  resources :fukyos do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
  end
end
