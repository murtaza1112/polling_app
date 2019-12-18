Rails.application.routes.draw do
  resources :mypolls
  resources :categories
  resources :polls
  root to: 'pages#home'
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
