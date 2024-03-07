Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'account_activations/edit'
  get 'sessions/new'
  get 'users/new'
  root                  'static_pages#home'
  get    'help'    =>   'static_pages#help'
  get    'about'   =>   'static_pages#about'
  get    'contact' =>   'static_pages#contact'
  get    'signup'  =>   'users#new'
  get    'login'   =>   'sessions#new'
  post   'login'   =>   'sessions#create'
  delete 'logout'  =>   'sessions#destroy'

  # resources :users basically just makes these for you
  # get    'users/:id' =>  'users#show'
  # post   'users/'    =>  'users#create'
  # put    'users/:id' =>  'users#update'
  # delete 'users/:id' =>  'users#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
end
