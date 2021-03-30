# frozen_string_literal: true

Rails.application.routes.draw do
  get '/:url', to: 'app#show'
  root 'app#index'
end
