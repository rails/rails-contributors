RailsContributors::Application.routes.draw do
  resources :contributors do
    resources :commits
  end

  resources :releases

  resource :names_mapping
  root :to => 'contributors#index'
end
