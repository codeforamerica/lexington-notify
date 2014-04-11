Notify::Application.routes.draw do
  root to: 'citizens#new'

  resource :notifications
  resources :citizens
  resources :addresses
  resource :pip
end
