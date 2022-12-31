require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects
   resources :projects do
    resources :comments, only: %i[create]
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
 authenticate :user, lambda { |u| u.admin? } do
   mount Sidekiq::Web => '/sidekiq'
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
