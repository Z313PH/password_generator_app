Rails.application.routes.draw do
  root "passwords#new"         # Show the form on the home page
  post "/generate", to: "passwords#create"
  delete "/delete/:id", to: "passwords#destroy", as: "delete_password"
end
