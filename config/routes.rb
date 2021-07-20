Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  devise_for :users
  root 'users#index'
  get 'users/index'
  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
