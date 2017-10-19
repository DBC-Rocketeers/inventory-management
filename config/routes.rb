Rails.application.routes.draw do
  resources :parts, only: [:index]
  resources :warehouses, only: [:index]
  resource :employees, only: [:create, :new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root "parts#index"
end
