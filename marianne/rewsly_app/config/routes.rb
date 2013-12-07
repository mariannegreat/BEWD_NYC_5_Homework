RewslyApp::Application.routes.draw do
  get "search", to: "search#index"
  root "stories#index"
  resources :stories
end
