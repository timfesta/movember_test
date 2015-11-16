Rails.application.routes.draw do
 
  get 'profile' => 'users#show'
  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root 'statics#index'


end
