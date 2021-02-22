Rails.application.routes.draw do
  resources :users
  resources :contacts
  get 'home/about'
  root 'home#index'
  get 'signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
