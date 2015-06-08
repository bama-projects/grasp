Rails.application.routes.draw do
  # Overrides urls for devise paths
  # Taken from http://stackoverflow.com/a/3845245 | doritostains | 11th May 2015, 10:12 am
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :courses do
    patch 'remove_member/:user_id' => 'courses#remove_member', as: :remove_member, on: :member

    resources :questions
  end

  match '*path', to: 'application#raise_routing_error', via: :all

  root 'courses#index'
end
