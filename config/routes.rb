Rails.application.routes.draw do
  resources :movie_halls
  resources :audis
  resources :movies
  resources :show_times
  resources :type_of_tickets
  resources :tickets
  resources :bookings
  resources :users
end
