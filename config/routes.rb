RailsContributors::Application.routes.draw do
  resources :contributors, :has_many => :commits
  resource :names_mapping
  resource :bugmash
  root :to => 'contributors#index'
end
