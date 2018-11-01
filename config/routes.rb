# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :images do
    resources :comments, only: :create
  end

  resources :hearts, only: %i(create destroy)
  resources :categories do
    put :follow, on: :member
    put :unfollow, on: :member
  end

  get 'comments', to: 'comments#index'

  root to: 'dashboard#index'
end
