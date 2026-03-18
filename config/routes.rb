Rails.application.routes.draw do
  devise_for :admins

  root "pages#home"

  get "/bienvenue", to: "pages#instagram_landing"

  resources :subscribers, only: [ :create ]
  resources :contacts, only: [ :create ]

  authenticate :admin do
    namespace :admin do
      get "/", to: "dashboard#index", as: :dashboard
      resources :posts
      resources :subscribers, only: [ :index ] do
        collection do
          get :export_csv
        end
      end
      resources :testimonials
      resources :articles do
        member do
          post :send_newsletter
        end
      end
      resources :contacts, only: [ :index, :show, :destroy ]
      resources :site_contents, only: [ :index ] do
        collection do
          get "edit/:section", action: :edit, as: :edit
          patch "update/:section", action: :update, as: :update
          delete "destroy_image", action: :destroy_image, as: :destroy_image
        end
      end
    end
  end

  get "/desinscrire/:token", to: "unsubscribes#show", as: :unsubscribe

  get "/blog", to: "articles#index", as: :blog
  get "/blog/:slug", to: "articles#show", as: :article

  get "up" => "rails/health#show", as: :rails_health_check
end
