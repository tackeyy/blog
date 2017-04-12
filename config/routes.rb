Rails.application.routes.draw do
  get 'blog/show'

  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :blog, only: [:show]
end
