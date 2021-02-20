Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/about"
  get "users/edit"
  
  put "users/edit"
  root "home#index"
end
