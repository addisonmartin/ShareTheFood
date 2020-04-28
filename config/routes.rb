# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Creates RESTful routes for the Donation model.
  resources :donations

  # Sets up the routes for user authentication through Devise.
  devise_for :users

  # Sets up the routes for static pages controlled by the PagesController.
  controller :pages do
    # sharethefood.net/about
    get :about
    # sharethefood.net/admin
    get :admin
  end

  # Sets the application's homepage to sharethefood.net/about
  root 'pages#about'
end
