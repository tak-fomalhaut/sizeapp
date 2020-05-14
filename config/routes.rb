Rails.application.routes.draw do
  root "posts#top"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show]
end
