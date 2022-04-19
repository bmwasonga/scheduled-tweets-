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

  get "password/reset", to: "password_resets#new", as: :password_reset
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  #get / root is the ruby equivalent of the index.html file
  root to: "main#index"
end
