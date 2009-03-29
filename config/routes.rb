ActionController::Routing::Routes.draw do |map|
  map.resources :contributors, :has_many => :commits
  map.root :controller => 'contributors'
end
