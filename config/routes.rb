Todayi::Application.routes.draw do
  get "home/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  resources :user_services

  get "oauth/callback/:provider" => "oauth#callback", :as => "oauth_callback"
  get "oauth/begin/:provider" => "oauth#begin", :as => "begin_oauth"
  
  root :to => "home#index"
end
