# frozen_string_literal: true

# For details on the DSL available within this file,
# see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Used to display web pages not backed by a database model.
  # See app/controllers/pages_controller.rb
  get '/pages/:page' => 'pages#show'

  # Sets the homepage of the website to /pages/home.
  root 'pages#show', page: 'home'
end
