DatePlannerApp::Application.routes.draw do
  root to: "sites#index"

  get '/wingman', to: "sites#index"

  resources :intineraries 
  
end
