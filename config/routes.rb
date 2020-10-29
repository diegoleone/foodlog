Rails.application.routes.draw do
  resources :users
  resources :categories
  get 'archives/index'
  resources :entries
  root to: "entries#index"
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
