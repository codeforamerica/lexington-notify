Notify::Application.routes.draw do
  root to: 'notifications#new'
  resource :notifications
end
