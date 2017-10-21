Rails.application.routes.draw do
  resources :orders
  resources :inventories
  resources :warehouses, only: [:new, :create, :index, :show]
  resource :employees, only: [:create, :new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root "inventories#index"
end
