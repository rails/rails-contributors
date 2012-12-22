RailsContributors::Application.routes.draw do
  resources :contributors do
    resources :commits, :only => :index
  end

  resources :releases do
    resources :commits, :only => :index
    resources :contributors, :only => :index
  end

  resource :names_mapping
  root :to => 'contributors#index'
end
