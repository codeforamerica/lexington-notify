Notify::Application.routes.draw do
  root to: 'citizens#new'

  resource :notifications
  resource :citizens
  resource :pip
end
