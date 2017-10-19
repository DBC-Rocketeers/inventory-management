Rails.application.routes.draw do
  resources :warehouses, only: [:index]
end
