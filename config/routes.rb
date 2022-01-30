Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'signup'  => 'users#new'
  post   'signup' => 'users#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :profiles
  resources :educations

end




