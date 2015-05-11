Rails.application.routes.draw do
  devise_for :users

  # Sets additional urls for devise paths
  # Taken from http://stackoverflow.com/a/3827783 | shingara | 11th May 2015, 09:28 am
  get 'login', to: 'devise/sessions#new'
  get 'logout', to: 'devise/sessions#destroy'
  get 'register', to: 'devise/registrations#new'

  root 'dashboard#index'
end
