# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                 donations GET    (/:locale)/donations(.:format)                                                           donations#index
#                           POST   (/:locale)/donations(.:format)                                                           donations#create
#              new_donation GET    (/:locale)/donations/new(.:format)                                                       donations#new
#             edit_donation GET    (/:locale)/donations/:id/edit(.:format)                                                  donations#edit
#                  donation GET    (/:locale)/donations/:id(.:format)                                                       donations#show
#                           PATCH  (/:locale)/donations/:id(.:format)                                                       donations#update
#                           PUT    (/:locale)/donations/:id(.:format)                                                       donations#update
#                           DELETE (/:locale)/donations/:id(.:format)                                                       donations#destroy
#                     posts GET    (/:locale)/posts(.:format)                                                               posts#index
#                           POST   (/:locale)/posts(.:format)                                                               posts#create
#                  new_post GET    (/:locale)/posts/new(.:format)                                                           posts#new
#                 edit_post GET    (/:locale)/posts/:id/edit(.:format)                                                      posts#edit
#                      post GET    (/:locale)/posts/:id(.:format)                                                           posts#show
#                           PATCH  (/:locale)/posts/:id(.:format)                                                           posts#update
#                           PUT    (/:locale)/posts/:id(.:format)                                                           posts#update
#                           DELETE (/:locale)/posts/:id(.:format)                                                           posts#destroy
#          new_user_session GET    (/:locale)/users/sign_in(.:format)                                                       users/sessions#new
#              user_session POST   (/:locale)/users/sign_in(.:format)                                                       users/sessions#create
#      destroy_user_session DELETE (/:locale)/users/sign_out(.:format)                                                      users/sessions#destroy
#         new_user_password GET    (/:locale)/users/password/new(.:format)                                                  users/passwords#new
#        edit_user_password GET    (/:locale)/users/password/edit(.:format)                                                 users/passwords#edit
#             user_password PATCH  (/:locale)/users/password(.:format)                                                      users/passwords#update
#                           PUT    (/:locale)/users/password(.:format)                                                      users/passwords#update
#                           POST   (/:locale)/users/password(.:format)                                                      users/passwords#create
#  cancel_user_registration GET    (/:locale)/users/cancel(.:format)                                                        users/registrations#cancel
#     new_user_registration GET    (/:locale)/users/sign_up(.:format)                                                       users/registrations#new
#    edit_user_registration GET    (/:locale)/users/edit(.:format)                                                          users/registrations#edit
#         user_registration PATCH  (/:locale)/users(.:format)                                                               users/registrations#update
#                           PUT    (/:locale)/users(.:format)                                                               users/registrations#update
#                           DELETE (/:locale)/users(.:format)                                                               users/registrations#destroy
#                           POST   (/:locale)/users(.:format)                                                               users/registrations#create
#     new_user_confirmation GET    (/:locale)/users/confirmation/new(.:format)                                              users/confirmations#new
#         user_confirmation GET    (/:locale)/users/confirmation(.:format)                                                  users/confirmations#show
#                           POST   (/:locale)/users/confirmation(.:format)                                                  users/confirmations#create
#           new_user_unlock GET    (/:locale)/users/unlock/new(.:format)                                                    users/unlocks#new
#               user_unlock GET    (/:locale)/users/unlock(.:format)                                                        users/unlocks#show
#                           POST   (/:locale)/users/unlock(.:format)                                                        users/unlocks#create
#                     about GET    (/:locale)/about(.:format)                                                               pages#about
#                           GET    /:locale(.:format)                                                                       pages#about
#                      root GET    /                                                                                        pages#about
#         ahoy_email_engine        /ahoy                                                                                    AhoyEmail::Engine
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for AhoyEmail::Engine:
#  open_message GET  /messages/:id/open(.:format)  ahoy/messages#open
# click_message GET  /messages/:id/click(.:format) ahoy/messages#click

# rubocop:disable Layout/LineLength

# rubocop:enable Layout/LineLength

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Sets the user's locale as the first part of the URL. i.e. /en/donations, /en/donations/1, /fr/donations, etc.
  # Having the /locale parameter is optional. If it is not present the default locale, en, is used.
  scope '(/:locale)' do
    # Creates RESTful routes for donations.
    resources :donations

    # Creates RESTful routes for posts.
    resources :posts

    # Creates user authentication routes.
    devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      unlocks: 'users/unlocks'
    }

    # Sets up the routes for static pages not backed by a database model.
    controller :pages do
      # /about
      get :about
    end
  end

  # Sets the application's homepage with a locale specified to /about.
  get '/:locale' => 'pages#about'
  # Sets the application's homepage to /about
  root 'pages#about'
end
