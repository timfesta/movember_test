Rails.application.routes.draw do
 
  get 'profile' => 'users#show'

  get 'signup' => 'users#new'

  resources :users

  root 'statics#index'


end
