# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                 donations GET    /donations(.:format)                                                                     donations#index
#                           POST   /donations(.:format)                                                                     donations#create
#              new_donation GET    /donations/new(.:format)                                                                 donations#new
#             edit_donation GET    /donations/:id/edit(.:format)                                                            donations#edit
#                  donation GET    /donations/:id(.:format)                                                                 donations#show
#                           PATCH  /donations/:id(.:format)                                                                 donations#update
#                           PUT    /donations/:id(.:format)                                                                 donations#update
#                           DELETE /donations/:id(.:format)                                                                 donations#destroy
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)                                                        devise/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)                                                            devise/confirmations#show
#                           POST   /users/confirmation(.:format)                                                            devise/confirmations#create
#           new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#               user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                           POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#                     about GET    /about(.:format)                                                                         pages#about
#                      root GET    /                                                                                        pages#about
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Sets the user's locale as the first part of the URL. i.e. /en/donations, /en/donations/1, /fr/donations, etc.
  # Having the /locale parameter is optional. If it is not present the default locale, en, is used.
  scope '(/:locale)' do
    # Creates RESTful routes for donations.
    resources :donations

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
