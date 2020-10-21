Rails.application.routes.draw do
  devise_for :users
  resources :vehicles, except: :show

  get "models", controller: :fipe
end
