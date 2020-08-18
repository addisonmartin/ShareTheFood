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
#          new_user_session GET    (/:locale)/users/sign_in(.:format)                                                       devise/sessions#new
#              user_session POST   (/:locale)/users/sign_in(.:format)                                                       devise/sessions#create
#      destroy_user_session DELETE (/:locale)/users/sign_out(.:format)                                                      devise/sessions#destroy
#         new_user_password GET    (/:locale)/users/password/new(.:format)                                                  devise/passwords#new
#        edit_user_password GET    (/:locale)/users/password/edit(.:format)                                                 devise/passwords#edit
#             user_password PATCH  (/:locale)/users/password(.:format)                                                      devise/passwords#update
#                           PUT    (/:locale)/users/password(.:format)                                                      devise/passwords#update
#                           POST   (/:locale)/users/password(.:format)                                                      devise/passwords#create
#  cancel_user_registration GET    (/:locale)/users/cancel(.:format)                                                        devise/registrations#cancel
#     new_user_registration GET    (/:locale)/users/sign_up(.:format)                                                       devise/registrations#new
#    edit_user_registration GET    (/:locale)/users/edit(.:format)                                                          devise/registrations#edit
#         user_registration PATCH  (/:locale)/users(.:format)                                                               devise/registrations#update
#                           PUT    (/:locale)/users(.:format)                                                               devise/registrations#update
#                           DELETE (/:locale)/users(.:format)                                                               devise/registrations#destroy
#                           POST   (/:locale)/users(.:format)                                                               devise/registrations#create
#     new_user_confirmation GET    (/:locale)/users/confirmation/new(.:format)                                              devise/confirmations#new
#         user_confirmation GET    (/:locale)/users/confirmation(.:format)                                                  devise/confirmations#show
#                           POST   (/:locale)/users/confirmation(.:format)                                                  devise/confirmations#create
#           new_user_unlock GET    (/:locale)/users/unlock/new(.:format)                                                    devise/unlocks#new
#               user_unlock GET    (/:locale)/users/unlock(.:format)                                                        devise/unlocks#show
#                           POST   (/:locale)/users/unlock(.:format)                                                        devise/unlocks#create
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
    devise_for :users

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
