# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  resources :tables
  resources :companies
  resources :demands
  root to: 'companies#index'

  namespace :api do
    namespace :v1 do
      get 'company/:id/table/:table_id/all_products', to: 'products#all_products'
      post 'company/:id/create_demand', to: 'demands#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
