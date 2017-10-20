Rails.application.routes.draw do
  resources :orders, only: [:new, :index]
  resources :inventories, only: [:index, :new, :create]
  resources :warehouses, only: [:index, :show]
  resource :employees, only: [:create, :new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root "inventories#index"
end
