Rails.application.routes.draw do
  get 'contributors/in-time-window/:time_window' => 'contributors#in_time_window', as: 'contributors_in_time_window'

  resources :contributors, only: 'index' do
    get 'commits/in-time-window/:time_window' => 'commits#in_time_window', as: 'commits_in_time_window'
    get 'commits/in-release/:release_id'      => 'commits#in_release',     as: 'commits_in_release'
    get 'commits/in-edge'                     => 'commits#in_edge',        as: 'commits_in_edge'

    resources :commits, only: 'index'
  end

  resources :releases, only: 'index' do
    resources :commits,      only: 'index'
    resources :contributors, only: 'index'
  end

  get 'edge/contributors' => 'contributors#in_edge', as: 'contributors_in_edge'

  resource :faq, only: :show

  root to: 'contributors#index'
end
