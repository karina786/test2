Rails.application.routes.draw do
  devise_for :donars
  root 'donations#index'
  get "/search", to: "donations#search"
  get "donations/aboutus"
  
  resources :donations do
    resources :reviews
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
