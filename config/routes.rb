Rails.application.routes.draw do
  get 'users/profile'
  root 'pages#home'
  get '/about', to: 'pages#about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/user/:id', to: 'users#profile', as: 'user'

  resources :posts
end
