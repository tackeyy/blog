Rails.application.routes.draw do
  get 'tags/show'

  get 'categories/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :blog, only: [:show], concerns: :paginatable
  resources :categories, only: [:index, :show]
  resources :tags, only: [:show]
end
