ActionController::Routing::Routes.draw do |map|
  map.resources :contributors, :has_many => :contributions
  map.root :controller => 'contributors'
end
