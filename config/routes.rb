# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images do
    resources :comments
  end

  resources :categories

  root to: 'dashboard#index'

  match 'heart', to: 'hearts#heart', via: :post
  match 'unheart', to: 'hearts#unheart', via: :delete
end
