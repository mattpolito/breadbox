Breadbox::Application.routes.draw do
  resources :invoices, has_many: :payments
  resources :users
  resources :clients, has_many: :invoices
  resources :organizations

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # get '/deliver/:type/:id', 'notifications#deliver', as: 'deliver'
  # get '/login', 'user_sessions#new', as: 'login'
  # get '/logout', 'user_sessions#destroy', as: 'logout'
  # map.settings '/settings', :controller => 'organizations', :action => 'edit', :id => :current_organization
  
  # root to: 'dashboard#index'
end
