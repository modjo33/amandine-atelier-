Rails.application.routes.draw do
  devise_for :admins

  root "pages#home"

  get "/bienvenue", to: "pages#instagram_landing"

  resources :subscribers, only: [ :create ]

  authenticate :admin do
    namespace :admin do
      resources :posts
      resources :subscribers, only: [ :index ]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
