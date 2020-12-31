Rails.application.routes.draw do
  get 'cemewords/create'
  get 'cemewords/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

  resources :cemewords, only: [:create, :destroy]
end
