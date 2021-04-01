# frozen_string_literal: true

Rails.application.routes.draw do
  resources :app, only: %i[create]
  get '/:url', to: 'app#show', as: 'show'
  root 'app#index'
end
