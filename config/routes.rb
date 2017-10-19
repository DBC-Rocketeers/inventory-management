Rails.application.routes.draw do
  resources :orders, only: [:new]
  resources :parts, only: [:index]
  resource :employees, only: [:create, :new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root "parts#index"
end
