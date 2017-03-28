Rails.application.routes.draw do
 
  get 'profile' => 'users#show'
  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :sessions

  resources :microposts

  root 'statics#index'


end
