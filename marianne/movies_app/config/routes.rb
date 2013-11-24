MoviesApp::Application.routes.draw do
  root "movies#index"
  resources :movies, only: [:index, :new, :create, :show, :edit, :update]
  get "search", to: "search#index"
  get "all", to: "movies#all"
end
