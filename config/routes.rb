Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get 'static/home' => 'static#home'
  
  resources :artists
  resources :albums
  resources :tracks
end
