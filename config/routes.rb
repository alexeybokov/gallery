# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, only: :omniauth_callbacks, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated do
    root to: "secret#index", as: :authenticated_root
  end

  scope '(:locale)' do
    devise_for :users, skip: :omniauth_callbacks
    resources :images, only: %i[index show new create] do
      resources :comments, only: :create
    end

    resources :categories do
      put :follow, on: :member
      put :unfollow, on: :member
    end

    resources :hearts, only: %i(create destroy)
    get 'comments', to: 'comments#index'
    # match '/hearts', to: 'hearts#create', via: [:get, :post]
    root to: 'dashboard#index'
  end
end
