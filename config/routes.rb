Rails.application.routes.draw do
  resources :parts, only: [:index]

  root "parts#index"
end
