Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :trips, only: [:index]
  resources :articles, only: [:index, :show]

end
