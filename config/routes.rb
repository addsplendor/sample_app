Rails.application.routes.draw do
  get 'users/new'
  root              'static_pages#home'
  get 'help' =>     'static_pages#help'
  get 'about' =>    'static_pages#about'
  get 'contact' =>  'static_pages#contact'
  get 'signup' =>   'users#new'
  # resources :users basically just makes these for you
  # get 'users/:id' =>  'users#show'
  # post 'users/' =>  'users#create'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
  resources :users
end
