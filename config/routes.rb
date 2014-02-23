DatePlannerApp::Application.routes.draw do
  root to: "sites#index"

  get '/wingman', to: "sites#index", as: :wingman

  resources :intineraries 


# get "/wingman", to: "sites#index"
# get "/intineraries", to: "intineraries#index"
# post "/intineraries", to: "intineraries#create"
# get "/intineraries/new", to: "intineraries#new"
# get "/intineraries/:id/edit", to: "intineraries#edit"
# get "/intineraries/:id", to: "intineraries#show"
# patch "/intineraries/:id", to: "intineraries#update"
# put "/intineraries/:id", to: "intineraries#update"
# delete "/intineraries/:id", to: "intineraries#destroy"
  
end
