DatePlannerApp::Application.routes.draw do
  root to: "sites#index"

  get '/wingman', to: "sites#index"

  get "itineraries/index"
  get "itineraries/new"
  get "itineraries/create"
  get "itineraries/show"
  get "itineraries/update"
  get "itineraries/delete"


  
end
