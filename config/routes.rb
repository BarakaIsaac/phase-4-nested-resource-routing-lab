Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show] do
    member do
      get "/items", to: "items#user_items"
      get "/items/:id", to: "items#show_user_item"
    end
    post "/items", to: "items#create_user_item"
  end
  end
