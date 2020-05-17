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
    member do
      get 'fromlike', 'forlike'
    end
  end
  resources :users, only: [:edit, :update, :show]
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'

  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
end
