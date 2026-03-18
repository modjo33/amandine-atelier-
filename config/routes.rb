Rails.application.routes.draw do
  devise_for :admins

  root "pages#home"

  get "/bienvenue", to: "pages#instagram_landing"

  resources :subscribers, only: [ :create ]

  authenticate :admin do
    namespace :admin do
      get "/", to: "dashboard#index", as: :dashboard
      resources :posts
      resources :subscribers, only: [ :index ]
      resources :site_contents, only: [ :index ] do
        collection do
          get "edit/:section", action: :edit, as: :edit
          patch "update/:section", action: :update, as: :update
          delete "destroy_image", action: :destroy_image, as: :destroy_image
        end
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
