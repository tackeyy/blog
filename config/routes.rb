Rails.application.routes.draw do
  root 'home#index'

  resources 'feed', only: %i(index)

  Redirection.all.each do |redirection|
    get redirection.before.to_s => redirect(redirection.after.to_s)
  end

  resource :admin, only: %i[show] do
    resources :posts
  end

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :blog, only: %i(show), concerns: :paginatable
  resources :categories, only: %i(index show)
  resources :tags, only: %i(index show)
end
