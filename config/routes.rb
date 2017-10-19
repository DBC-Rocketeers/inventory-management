Rails.application.routes.draw do
  resource :employees, only: [:new]
end
