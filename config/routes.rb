Rails.application.routes.draw do
  root "passwords#new"         # Show the form on the home page
  resources :passwords, only: [:create, :destroy]
end
