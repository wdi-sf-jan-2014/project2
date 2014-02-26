DatePlannerApp::Application.routes.draw do
  devise_for :users
  root to: "sites#index"
  post '/wingman', to: 'sites#create'

  get '/wingman', to: "sites#index"
  post '/yelpfinds', to: 'yelpfinds#create'
  get '/funcheaps', to: 'funcheaps#perform_scrape'
  post '/funcheaps', to: 'funcheaps#create'

  resources :itineraries 

#           root GET    /                               sites#index
#        wingman GET    /wingman(.:format)              sites#index
#    itineraries GET    /itineraries(.:format)          itineraries#index
#                POST   /itineraries(.:format)          itineraries#create
#  new_itinerary GET    /itineraries/new(.:format)      itineraries#new
# edit_itinerary GET    /itineraries/:id/edit(.:format) itineraries#edit
#      itinerary GET    /itineraries/:id(.:format)      itineraries#show
#                PATCH  /itineraries/:id(.:format)      itineraries#update
#                PUT    /itineraries/:id(.:format)      itineraries#update
#                DELETE /itineraries/:id(.:format)      itineraries#destroy

  
end
