Rails.application.routes.draw do
  #GET /about
  get "about-us", to: "about#index", as: :about

  #GET /sign-up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  #get / root is the ruby equivalent of the index.html file
  root to: "main#index"
end
