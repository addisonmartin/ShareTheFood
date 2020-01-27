# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                             donations GET    /donations(.:format)                                                                     donations#index
#                                       POST   /donations(.:format)                                                                     donations#create
#                          new_donation GET    /donations/new(.:format)                                                                 donations#new
#                         edit_donation GET    /donations/:id/edit(.:format)                                                            donations#edit
#                              donation GET    /donations/:id(.:format)                                                                 donations#show
#                                       PATCH  /donations/:id(.:format)                                                                 donations#update
#                                       PUT    /donations/:id(.:format)                                                                 donations#update
#                                       DELETE /donations/:id(.:format)                                                                 donations#destroy
#                      new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                                       PUT    /users(.:format)                                                                         users/registrations#update
#                                       DELETE /users(.:format)                                                                         users/registrations#destroy
#                                       POST   /users(.:format)                                                                         users/registrations#create
#                 new_user_confirmation GET    /users/confirmation/new(.:format)                                                        devise/confirmations#new
#                     user_confirmation GET    /users/confirmation(.:format)                                                            devise/confirmations#show
#                                       POST   /users/confirmation(.:format)                                                            devise/confirmations#create
#                       new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#                           user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                                       POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#                                       GET    /pages/:page(.:format)                                                                   pages#show
#                                  root GET    /                                                                                        pages#show {:page=>"home"}
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# rubocop:enable Metrics/LineLength

Rails.application.routes.draw do
  # Creates RESTful routes for Donation model.
  # See app/controllers/donation_controller.rb
  resources :donations

  # Creates all necessary routes for user authentication.
  # Only the registrations controller is overridden, to make it so user's
  # accounts are soft deleted, not permanently deleted.
  devise_for :users,
             controllers: { registrations: 'users/registrations' }

  # Used to display web pages not backed by a database model.
  # See app/controllers/pages_controller.rb
  get '/pages/:page' => 'pages#show'

  # Sets the homepage of the website to /pages/home.
  root 'pages#show', page: 'home'

  # Returns true if the user is authenticated and an admin user.
  # Used to mount logster's web interface.
  admin_constraint = lambda do |request|
    request.env['warden'].authenticate? and request.env['warden'].user.admin?
  end

  # Used to view the logs directly from the website, only for admin users.
  constraints admin_constraint do
    mount Logster::Web, at: '/logs'
  end
end
