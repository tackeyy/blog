Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resources 'feed', only: %i(index)

  Redirection.all.each do |redirection|
    get redirection.before.to_s => redirect(redirection.after.to_s)
  end

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :blog, only: %i(show), concerns: :paginatable
  resources :categories, only: %i(index show)
  resources :tags, only: %i(show)
end
