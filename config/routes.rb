Rails.application.routes.draw do
  resources :bookings
  get 'flight_searches/new'
  get 'flight_searches/index'
  get 'flight_searches/create'
  resources :flight_searches, only: [:new, :create, :show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root to: 'flight_searches#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
