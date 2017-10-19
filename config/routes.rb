Rails.application.routes.draw do
  resource :employees, only: [:create, :new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
