Rails.application.routes.draw do
  # Overrides urls for devise paths
  # Taken from http://stackoverflow.com/a/3845245 | doritostains | 11th May 2015, 10:12 am
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :boards

  match '*path', to: 'application#raise_routing_error', via: :all

  root 'boards#index'
end
