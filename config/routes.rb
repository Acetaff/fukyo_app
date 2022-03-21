Rails.application.routes.draw do
  devise_for :users
  
  root to: "fukyos#index"

  resources :fukyos do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: :show do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
