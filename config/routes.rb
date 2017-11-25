Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
     resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
     resources :likes, only: [:create, :destroy]
     collection do
      get 'popular'
      get 'newest'
     end
  end
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show]
end
