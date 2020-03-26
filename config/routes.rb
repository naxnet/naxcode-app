# == Route Map
#
#                                      Prefix Verb   URI Pattern                                                                              Controller#Action
#                       new_professor_session GET    /professors/sign_in(.:format)                                                            devise/sessions#new
#                           professor_session POST   /professors/sign_in(.:format)                                                            devise/sessions#create
#                   destroy_professor_session DELETE /professors/sign_out(.:format)                                                           devise/sessions#destroy
#                      new_professor_password GET    /professors/password/new(.:format)                                                       devise/passwords#new
#                     edit_professor_password GET    /professors/password/edit(.:format)                                                      devise/passwords#edit
#                          professor_password PATCH  /professors/password(.:format)                                                           devise/passwords#update
#                                             PUT    /professors/password(.:format)                                                           devise/passwords#update
#                                             POST   /professors/password(.:format)                                                           devise/passwords#create
#               cancel_professor_registration GET    /professors/cancel(.:format)                                                             devise/registrations#cancel
#                  new_professor_registration GET    /professors/sign_up(.:format)                                                            devise/registrations#new
#                 edit_professor_registration GET    /professors/edit(.:format)                                                               devise/registrations#edit
#                      professor_registration PATCH  /professors(.:format)                                                                    devise/registrations#update
#                                             PUT    /professors(.:format)                                                                    devise/registrations#update
#                                             DELETE /professors(.:format)                                                                    devise/registrations#destroy
#                                             POST   /professors(.:format)                                                                    devise/registrations#create
#                            new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                                user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                        destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                           new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                          edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                               user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                             PUT    /users/password(.:format)                                                                devise/passwords#update
#                                             POST   /users/password(.:format)                                                                devise/passwords#create
#                    cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#                       new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#                      edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                           user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                             PUT    /users(.:format)                                                                         devise/registrations#update
#                                             DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                             POST   /users(.:format)                                                                         devise/registrations#create
#                                             GET    /users/courses/subscribe/:short_id(.:format)                                             users/courses#subscribe
#    users_course_assignment_assignment_users POST   /users/courses/:course_id/assignments/:assignment_id/assignment_users(.:format)          users/assignment_users#create
# new_users_course_assignment_assignment_user GET    /users/courses/:course_id/assignments/:assignment_id/assignment_users/new(.:format)      users/assignment_users#new
#     users_course_assignment_assignment_user GET    /users/courses/:course_id/assignments/:assignment_id/assignment_users/:id(.:format)      users/assignment_users#show
#                    users_course_assignments GET    /users/courses/:course_id/assignments(.:format)                                          users/assignments#index
#                     users_course_assignment GET    /users/courses/:course_id/assignments/:id(.:format)                                      users/assignments#show
#                               users_courses GET    /users/courses(.:format)                                                                 users/courses#index
#                                users_course GET    /users/courses/:id(.:format)                                                             users/courses#show
#                                             DELETE /users/courses/:id(.:format)                                                             users/courses#destroy
#                                             GET    /professors/courses/subscribe/:short_id(.:format)                                        professors/courses#subscribe
#         approve_professors_course_professor GET    /professors/courses/:course_id/professors/:id/approve(.:format)                          professors/professors#approve
#          reject_professors_course_professor GET    /professors/courses/:course_id/professors/:id/reject(.:format)                           professors/professors#reject
#                professors_course_professors GET    /professors/courses/:course_id/professors(.:format)                                      professors/professors#index
#                 professors_course_professor DELETE /professors/courses/:course_id/professors/:id(.:format)                                  professors/professors#destroy
#              approve_professors_course_user GET    /professors/courses/:course_id/users/:id/approve(.:format)                               professors/users#approve
#               reject_professors_course_user GET    /professors/courses/:course_id/users/:id/reject(.:format)                                professors/users#reject
#                     professors_course_users GET    /professors/courses/:course_id/users(.:format)                                           professors/users#index
#                      professors_course_user DELETE /professors/courses/:course_id/users/:id(.:format)                                       professors/users#destroy
#               professors_course_assignments GET    /professors/courses/:course_id/assignments(.:format)                                     professors/assignments#index
#                                             POST   /professors/courses/:course_id/assignments(.:format)                                     professors/assignments#create
#            new_professors_course_assignment GET    /professors/courses/:course_id/assignments/new(.:format)                                 professors/assignments#new
#           edit_professors_course_assignment GET    /professors/courses/:course_id/assignments/:id/edit(.:format)                            professors/assignments#edit
#                professors_course_assignment GET    /professors/courses/:course_id/assignments/:id(.:format)                                 professors/assignments#show
#                                             PATCH  /professors/courses/:course_id/assignments/:id(.:format)                                 professors/assignments#update
#                                             PUT    /professors/courses/:course_id/assignments/:id(.:format)                                 professors/assignments#update
#                                             DELETE /professors/courses/:course_id/assignments/:id(.:format)                                 professors/assignments#destroy
#                          professors_courses GET    /professors/courses(.:format)                                                            professors/courses#index
#                                             POST   /professors/courses(.:format)                                                            professors/courses#create
#                       new_professors_course GET    /professors/courses/new(.:format)                                                        professors/courses#new
#                      edit_professors_course GET    /professors/courses/:id/edit(.:format)                                                   professors/courses#edit
#                           professors_course GET    /professors/courses/:id(.:format)                                                        professors/courses#show
#                                             PATCH  /professors/courses/:id(.:format)                                                        professors/courses#update
#                                             PUT    /professors/courses/:id(.:format)                                                        professors/courses#update
#                                             DELETE /professors/courses/:id(.:format)                                                        professors/courses#destroy
#               rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#               rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#                  rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#               rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#                rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#              rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                             POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#           new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#          edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#               rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                             PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                             PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                             DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
#       rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                          rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#                   rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                          rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#                   update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                        rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

  devise_for :professors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :users do
    resources :courses, only: [:index, :show, :destroy] do
      collection do
        get 'subscribe/:short_id', to: 'courses#subscribe'
      end
      resources :assignments, only: [:index, :show] do
        resources :assignment_users, only: [:new, :create, :show] do
          member do
            post :result
            post :result_zip
            post :compilation_error
          end
        end
      end
    end
  end

  namespace :professors do
    resources :courses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'subscribe/:short_id', to: 'courses#subscribe'
      end
      resources :professors, only: [:index, :destroy] do
        member do
          get :approve
          get :reject
        end
      end
      resources :users, only: [:index, :destroy] do
        member do
          get :approve
          get :reject
        end
      end
      resources :assignments, only: [:index, :show,  :new, :create, :edit, :update, :destroy]
    end
  end
end
