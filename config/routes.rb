Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    post :confirm, action: :confirm_new, on: :new
    patch :confirm2, action: :confirm_edit, on: :member
  end
  resources :users, :only => [:index, :show]
end
