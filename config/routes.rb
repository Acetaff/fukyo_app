Rails.application.routes.draw do
  devise_for :users
  root to: "fukyos#index"
  resources :fukyos, only: [:index, :new]
end
