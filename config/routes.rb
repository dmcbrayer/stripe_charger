# == Route Map
#
#                         Prefix Verb       URI Pattern                                  Controller#Action
#         new_admin_user_session GET        /admin/login(.:format)                       active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                       active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                      active_admin/devise/sessions#destroy
#            admin_user_password POST       /admin/password(.:format)                    active_admin/devise/passwords#create
#        new_admin_user_password GET        /admin/password/new(.:format)                active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)               active_admin/devise/passwords#edit
#                                PATCH      /admin/password(.:format)                    active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                    active_admin/devise/passwords#update
#                     admin_root GET        /admin(.:format)                             admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)    admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)                 admin/admin_users#index
#                                POST       /admin/admin_users(.:format)                 admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)             admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)        admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)             admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)             admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)             admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)             admin/admin_users#destroy
#   batch_action_admin_attendees POST       /admin/attendees/batch_action(.:format)      admin/attendees#batch_action
#                admin_attendees GET        /admin/attendees(.:format)                   admin/attendees#index
#                                POST       /admin/attendees(.:format)                   admin/attendees#create
#             new_admin_attendee GET        /admin/attendees/new(.:format)               admin/attendees#new
#            edit_admin_attendee GET        /admin/attendees/:id/edit(.:format)          admin/attendees#edit
#                 admin_attendee GET        /admin/attendees/:id(.:format)               admin/attendees#show
#                                PATCH      /admin/attendees/:id(.:format)               admin/attendees#update
#                                PUT        /admin/attendees/:id(.:format)               admin/attendees#update
#                                DELETE     /admin/attendees/:id(.:format)               admin/attendees#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                   admin/dashboard#index
#     batch_action_admin_leaders POST       /admin/leaders/batch_action(.:format)        admin/leaders#batch_action
#                  admin_leaders GET        /admin/leaders(.:format)                     admin/leaders#index
#                                POST       /admin/leaders(.:format)                     admin/leaders#create
#               new_admin_leader GET        /admin/leaders/new(.:format)                 admin/leaders#new
#              edit_admin_leader GET        /admin/leaders/:id/edit(.:format)            admin/leaders#edit
#                   admin_leader GET        /admin/leaders/:id(.:format)                 admin/leaders#show
#                                PATCH      /admin/leaders/:id(.:format)                 admin/leaders#update
#                                PUT        /admin/leaders/:id(.:format)                 admin/leaders#update
#                                DELETE     /admin/leaders/:id(.:format)                 admin/leaders#destroy
#       batch_action_admin_trips POST       /admin/trips/batch_action(.:format)          admin/trips#batch_action
#                    admin_trips GET        /admin/trips(.:format)                       admin/trips#index
#                                POST       /admin/trips(.:format)                       admin/trips#create
#                 new_admin_trip GET        /admin/trips/new(.:format)                   admin/trips#new
#                edit_admin_trip GET        /admin/trips/:id/edit(.:format)              admin/trips#edit
#                     admin_trip GET        /admin/trips/:id(.:format)                   admin/trips#show
#                                PATCH      /admin/trips/:id(.:format)                   admin/trips#update
#                                PUT        /admin/trips/:id(.:format)                   admin/trips#update
#                                DELETE     /admin/trips/:id(.:format)                   admin/trips#destroy
#                 admin_comments GET        /admin/comments(.:format)                    admin/comments#index
#                                POST       /admin/comments(.:format)                    admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)                admin/comments#show
#                        leaders GET        /leaders(.:format)                           leaders#index
#                         leader GET        /leaders/:id(.:format)                       leaders#show
#                           root GET        /                                            trips#index
#                 trip_attendees POST       /trips/:trip_id/attendees(.:format)          attendees#create
#              new_trip_attendee GET        /trips/:trip_id/attendees/new(.:format)      attendees#new
#             edit_trip_attendee GET        /trips/:trip_id/attendees/:id/edit(.:format) attendees#edit
#                  trip_attendee PATCH      /trips/:trip_id/attendees/:id(.:format)      attendees#update
#                                PUT        /trips/:trip_id/attendees/:id(.:format)      attendees#update
#                                DELETE     /trips/:trip_id/attendees/:id(.:format)      attendees#destroy
#                          trips GET        /trips(.:format)                             trips#index
#                           trip GET        /trips/:id(.:format)                         trips#show
#

Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :leaders, only: [:index, :show]

  root to: 'trips#index'

  resources :trips, only: [:index, :show] do
    resources :attendees, except: [:index, :show]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
