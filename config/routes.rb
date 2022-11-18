# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :reclamos
  resources :room_messages
  resources :rooms
  resources :reserva_messages
  resources :user_reservas
  resources :canchas
  resources :resenas
  resources :reservas
  resources :reservas do
    resources :rooms
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'user/index'
  resources :canchas do
    resources :reservas
    resources :resenas # , only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'user#index'
  # root to: 'pages#index'
  match 'user/:email' => 'user#destroy', :via => :delete, :as => :admin_destroy_user
  match 'user/:email' => 'user#become_mod', :via => :post, :as => :user_become_mod
  match 'user/:id' => 'user#show', via: :get, :as => :user
  match 'user/:id/edit' => 'user#edit', via: :get, :as => :user_edit
  match 'user/:id' => 'user#update', via: :patch, :as => :user_update

  # match 'user/:email' => 'user#become_mod', :as => :become_mod
end
