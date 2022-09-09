Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'costumes/notice', to: 'costumes#notice'
  resources :costumes do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: [:update]
  get "/dashboard", to: "pages#dashboard"
end
