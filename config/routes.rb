# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, only: :omniauth_callbacks, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)' do
    devise_for :users, skip: :omniauth_callbacks
    resources :images, only: %i[index show new create] do
      get :download, on: :member

      resources :comments, only: %i[new create]
    end

    resources :categories do
      put :follow, on: :member
      put :unfollow, on: :member
    end

    resources :hearts, only: %i[create destroy]
    get 'comments', to: 'comments#index'
    root to: 'dashboard#index'
  end
end
