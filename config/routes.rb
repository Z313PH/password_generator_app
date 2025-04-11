Rails.application.routes.draw do
  root "passwords#new"         # Show the form on the home page
  post "/generate", to: "passwords#create"  # Handle form submission
end
