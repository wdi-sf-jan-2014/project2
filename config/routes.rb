DatePlannerApp::Application.routes.draw do
  root to: "sites#index"

  get '/wingman', to: "sites#index", as: :wingman

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
