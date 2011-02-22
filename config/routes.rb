RailsContributors::Application.routes.draw do
  resources :contributors do
    resources :commits
  end

  resource :names_mapping
  root :to => 'contributors#index'
end
