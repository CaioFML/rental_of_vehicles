Rails.application.routes.draw do
  devise_for :users
  resources :vehicles, except: :show
  resources :bookings, except: %i[show delete update]

  get "models", controller: :fipe
  root to: "bookings#new"
end
