Rails.application.routes.draw do
  resources :chirps

  root to: 'chirps#index'
end
