RailsContributors::Application.routes.draw do
  match 'contributors/in-time-window/:time_window' => 'contributors#in_time_window', as: 'contributors_in_time_window', via: 'get'

  resources :contributors, only: 'index' do
    with_options(via: 'get') do |_|
      _.match 'commits/in-time-window/:time_window' => 'commits#in_time_window', as: 'commits_in_time_window'
      _.match 'commits/in-release/:release_id'      => 'commits#in_release',     as: 'commits_in_release'
      _.match 'commits/in-edge'                     => 'commits#in_edge',        as: 'commits_in_edge'
    end
    resources :commits, only: 'index'
  end

  resources :releases, only: 'index' do
    resources :commits, only: 'index'
    resources :contributors, only: 'index'
  end

  match 'edge/contributors' => 'contributors#in_edge', as: 'contributors_in_edge', via: 'get'

  root to: 'contributors#index'
end
