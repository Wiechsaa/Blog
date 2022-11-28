# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  root 'pages#home'
  get 'search', to: 'search#index'
  get 'users/profile'
  get '/about', to: 'pages#about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/user/:id', to: 'users#profile', as: 'user'

  resources :posts do
    resources :comments
  end

  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'
  end
end
