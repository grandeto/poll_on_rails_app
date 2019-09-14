Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :poll_options
  resources :polls
  resources :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
