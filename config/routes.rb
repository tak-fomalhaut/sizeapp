Rails.application.routes.draw do
  root "posts#top"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts
  resources :users, only: [:edit, :update, :show]
end
