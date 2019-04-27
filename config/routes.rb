Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root to: 'static_pages#home'
  devise_for :users
  resources :posts do
    post :confirm, action: :confirm_new, on: :new
    patch :confirm2, action: :confirm_edit, on: :member
    resources :comments, only: [:create, :destroy]
  end
  resources :users, :only => [:index, :show]
  resources :likes, only: [:create, :destroy]
end
