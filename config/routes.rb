ActionController::Routing::Routes.draw do |map|
  map.resources :contributors, :has_many => :commits
  map.resource :names_mapping
  map.root :controller => 'contributors'
end
