# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Sets up the routes for user authentication through Devise.
  devise_for :users

  # Sets up the routes for static pages controlled by the PagesController.
  controller :pages do
    # sharethefood.net/about
    get :about
  end

  # Sets the application's homepage to sharethefood.net/about
  root 'pages#about'
end
