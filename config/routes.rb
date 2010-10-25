# -*- coding: utf-8 -*-
ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # users
  map.user 'moj_profil/:id', :controller => 'users', :action => 'show'
  map.edit_user 'edytuj_profil/:id', :controller => 'users', :action => 'edit'
  map.pending_user 'wyslane_zaproszenia/:id', :controller => 'users', :action => 'pending'
  map.requested_user 'otrzymane_zaproszenia/:id', :controller => 'users', :action => 'requested'
  map.requested_user 'otrzymane_zaproszenia/:id', :controller => 'users', :action => 'requested'
  map.friends_user 'twoi_znajomi/:id', :controller => 'users', :action => 'friends'
  map.friends_index_user 'znajomi/:id', :controller => 'users', :action => 'friends_index'
  map.myteams_user 'moje_grupy/:id', :controller => 'users', :action => 'myteams'

  # user galleries
  map.galleries 'galerie', :controller => 'galleries', :action => 'index'
  map.user_galleries 'galerie_użytkownika/:user_id', :controller => 'galleries', :action => 'index'

  #event
  map.list_events 'imprezy/:id', :controller => 'events', :action => 'list'
  map.new_event 'dodaj_impreze', :controller => 'events', :action => 'new'

  # messages 
  map.newr_messages 'napisz_wiadomosc', :controller => 'messages', :action => 'newr'
  map.received_messages 'odebrane_wiadomosc', :controller => 'messages', :action => 'received'
  map.sent_messages 'wyslane_wiadomosc', :controller => 'messages', :action => 'sent'
  map.messages 'poczta', :controller => 'messages', :action => 'index'

  # teams
  map.teams 'grupy', :controller => 'teams', :action => 'index'
  map.list_teams 'wszystkie_grupy', :controller => 'teams', :action => 'list'
  map.new_team 'utworz_grupe', :controller => 'teams', :action => 'new'
  map.find_form_teams 'znajdz_grupe', :controller => 'teams', :action => 'find_form'

  # other
  map.admin_panel '/admin_panel', :controller => 'home'
  map.login '/user/login', :controller => 'user_sessions', :action => "new"
  map.logout '/user/logout', :controller => 'user_sessions', :action => "destroy"

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #     map.resources :user_sessions

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  map.resources :sale_ads
  map.resources :buy_ads
  map.resources :workshops, :member => {:show_on_google_map => :get}
  map.resources :shops, :member => {:show_on_google_map => :get}
  map.resources :assets
  map.resources :banners
  map.resources :comments
  map.resources :messages, :collection => {:newr => :get, :received => :get, :sent => :get}

  map.resources :events, :collection => {:list => :get} do |event|
    event.resources :galleries
  end

  map.resources :galleries
  map.resources :photos, :member => { :main => :get, :vote => :post }, :collection => { :list => :get }
  map.resources :videos, :member => { :vote => :post }, :collection => { :search => :any, :list => :get }

  map.resources :teams, :collection => { :list => :get, :find_form => :get, :find => :post, :admin_list => :get }
  map.resources :users, :member => { :friends_index => :get, :friends => :get, :pending => :get, :requested => :get, :myteams => :get}, :collection => {:find => :get } do |user|
    user.resources :galleries
  end
    
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  ActionController::Routing::Routes.draw do |map|  
    map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'  
  end
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "site"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
