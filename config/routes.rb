Notify::Application.routes.draw do
  root to: 'citizens#new'

  resource :notifications
  resources :citizens
  resource :pip
end
