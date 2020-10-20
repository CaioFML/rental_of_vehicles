Rails.application.routes.draw do
  devise_for :users
  resources :vehicles

  get "models", controller: :fipe
end
