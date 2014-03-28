Notify::Application.routes.draw do
  root to: 'notifications#index'

  resource :notifications
  resource :citizens
end
