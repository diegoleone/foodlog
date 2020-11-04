Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :entries
  root to: "users#welcome"
  get 'signup', to: 'users#new'
  get 'entries', to: "entries#index"
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
