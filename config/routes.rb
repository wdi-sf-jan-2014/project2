DatePlannerApp::Application.routes.draw do
  devise_for :users

  root to: 'sites#index'
  post '/wingman', to: 'sites#create'
  get '/wingman', to: 'sites#index'

  get '/funcheaps', to: 'funcheaps#perform_scrape'
  post '/funcheaps', to: 'funcheaps#create'


  resources :itineraries, :users

  # get    '/users/sign_in',        to: 'devise/sessions#new', as: :new_user_session
  # post   '/users/sign_in',        to: 'devise/sessions#create', as: :user_session
  # delete '/users/sign_out',       to: 'devise/sessions#destroy', as: :destroy_user_session
  # post   '/users/password',       to: 'devise/passwords#create', as: :user_password
  # get    '/users/password/new',   to: 'devise/passwords#new', as: :new_user_password
  # get    '/users/password/edit',  to: 'devise/passwords#edit', as: :edit_user_password
  # patch  '/users/password',       to: 'devise/passwords#update'
  # put    '/users/password',       to: 'devise/passwords#update'
  # get    '/users/cancel',         to: 'devise/registrations#cancel', as: :cancel_user_registration
  # post   '/users',                to: 'devise/registrations#create', as: :user_registration
  # get    '/users/sign_up',        to: 'devise/registrations#new', as: :new_user_registration
  # get    '/users/edit',           to: 'devise/registrations#edit', as: :edit_user_registration
  # patch  '/users',                to: 'devise/registrations#update'
  # put    '/users',                to: 'devise/registrations#update'
  # delete '/users',                to: 'devise/registrations#destroy'
#                     root GET    /                               sites#index
#                  wingman GET    /wingman(.:format)              sites#index
#                yelpfinds POST   /yelpfinds(.:format)            yelpfinds#create
#                funcheaps GET    /funcheaps(.:format)            funcheaps#perform_scrape
#                          POST   /funcheaps(.:format)            funcheaps#create
#              itineraries GET    /itineraries(.:format)          itineraries#index
#                          POST   /itineraries(.:format)          itineraries#create
#            new_itinerary GET    /itineraries/new(.:format)      itineraries#new
#           edit_itinerary GET    /itineraries/:id/edit(.:format) itineraries#edit
#                itinerary GET    /itineraries/:id(.:format)      itineraries#show
#                          PATCH  /itineraries/:id(.:format)      itineraries#update
#                          PUT    /itineraries/:id(.:format)      itineraries#update
#                          DELETE /itineraries/:id(.:format)      itineraries#destroy
  
end
