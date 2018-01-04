Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :trips, only: [:index]
  resources :articles, only: [:index, :show]
  resources :menu, only: [:index]
  resources :points do
    resources :media, only: [:index]
  end
  resources :suggestion_types, only: [:index]
  resources :suggestions, only: [:create]

end
