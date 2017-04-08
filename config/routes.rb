Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resource :users, except: [:index, :new, :crete] do
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
  end
end
