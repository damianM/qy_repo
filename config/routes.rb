# -*- coding: utf-8 -*-
ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # users
  map.user 'profil/:id', :controller => 'users', :action => 'show'
  map.new_user 'zarejestruj-sie', :controller => 'users', :action => 'new'
  map.ulogin_users 'nie-pamietasz-hasla', :controller => 'users', :action => 'ulogin'
  map.edit_user 'edytuj-profil/:id', :controller => 'users', :action => 'edit'
  map.myteams_user 'moje-grupy/:id', :controller => 'users', :action => 'myteams'
  map.find_users 'znajdz-quadomanika', :controller => 'users', :action => 'find'
 
  # friends
  map.pending_user 'wyslane-zaproszenia', :controller => 'users', :action => 'pending'
  map.requested_user 'otrzymane-zaproszenia', :controller => 'users', :action => 'requested'
  map.friends_user 'twoi-znajomi/:id', :controller => 'users', :action => 'friends'
  map.friends_index_user 'znajomi/:id', :controller => 'users', :action => 'friends_index'

  # user galleries
  map.galleries 'galerie', :controller => 'galleries', :action => 'index'
  map.user_galleries 'galerie-uzytkownika/:user_id', :controller => 'galleries', :action => 'index'
  map.new_user_gallery 'nowa-galeria/:user_id', :controller => 'galleries', :action => 'new'
  map.create_user_gallery 'dodaj-galerie/:user_id', :controller => 'galleries', :action => 'create', :method => :post

  # event galleries
  map.new_event_gallery 'nowa-album/:event_id', :controller => 'galleries', :action => 'new'
  map.create_event_gallery 'dodaj-album/:event_id', :controller => 'galleries', :action => 'create', :method => :post


  #event
  map.find_events 'imprezy', :controller => 'events', :action => 'find'
  map.list_events 'moje-imprezy/:id', :controller => 'events', :action => 'list'
  map.new_event 'nowa-impreza', :controller => 'events', :action => 'new'
  map.create_event 'dodaj-impreze', :controller => 'events', :action => 'create', :method => :post
  map.edit_event 'edytuj-impreze/:id', :controller => 'events', :action => 'edit'
  map.update_event 'aktualizuj-impreze/:id', :controller => 'events', :action => 'update', :method => :put
  map.show_event 'impreza/:id', :controller => 'events', :action => 'show'
  map.destroy_event 'usun-impreze/:id', :controller => 'events', :action => 'destroy', :method => :delete

  # messages 
  map.newr_messages 'napisz-wiadomosc', :controller => 'messages', :action => 'newr'
  map.new_message 'napisz-wiadomosc', :controller => 'messages', :action => 'new'
  map.create_message 'dodaj-wiadomosc', :controller => 'messages', :action => 'create'
  map.received_messages 'odebrane-wiadomosc', :controller => 'messages', :action => 'received'
  map.sent_messages 'wyslane-wiadomosc', :controller => 'messages', :action => 'sent'


  # teams
  map.teams 'grupy', :controller => 'teams', :action => 'index'
  map.list_teams 'wszystkie-grupy', :controller => 'teams', :action => 'list'
  map.new_team 'nowa-grupa', :controller => 'teams', :action => 'new'
  map.create_team 'dodaj-grupe', :controller => 'teams', :action => 'create'
  map.team 'pokaz-grupe/:id', :controller => 'teams', :action => 'show'
  map.join_team 'dolacz-do-grupy/:id', :controller => 'teams', :action => 'join'
  map.leave_team 'opusc-grupe/:id', :controller => 'teams', :action => 'leave'
  map.pending_list_team 'oczekujacy-w-grupie/:id', :controller => 'teams', :action => 'pending_list'
  map.destroy_team 'usun-grupe/:id', :controller => 'teams', :action => 'destroy'

  map.find_form_teams 'znajdz-grupe', :controller => 'teams', :action => 'find_form'

  # videos
  map.videos 'filmy', :controller => 'videos', :action => 'index'
#  map.create_video 'dodaj-film', :controller => 'videos', :action => 'create'

  # zdjecia
  map.photos 'zdjecia', :controller => 'photos', :action => 'index'
  map.create_photo 'dodaj-zdjecie', :controller => 'photos', :action => 'create'

  # worksshops
  map.workshops 'serwisy-przyjazne-quadomanikom', :controller => 'workshops', :action => 'index'

  # shops
  map.shops 'sklepy-przyjazne-quadomanikom', :controller => 'shops', :action => 'index'

  # sale_ads
  map.sale_ads 'ogloszenia-sprzedazy', :controller => 'sale_ads', :action => 'index'

  # relationship 
  map.relationship_req 'zapros-do-znajomych/:id', :controller => 'relationship', :action => 'req'

  # other
  map.login_forum 'forum/:id', :controller => 'forum', :action => 'login'
  map.admin_panel '/admin-panel', :controller => 'home'
  map.login 'zaloguj', :controller => 'user_sessions', :action => "new"
  map.logout 'wyloguj', :controller => 'user_sessions', :action => "destroy"

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

  map.resources :photos, :member => { :main => :get, :vote => :post }, :collection => { :list => :get }
  map.resources :videos, :member => { :vote => :post }, :collection => { :search => :any, :list => :get, :check_upload => :get, :set_attributes => :post }

  map.resources :teams, :collection => { :list => :get, :find_form => :get, :find => :post, :admin_list => :get }
  map.resources :users, :member => { :friends_index => :get, :friends => :get, :pending => :get, :requested => :get, :myteams => :get}, :collection => {:find => :get } do |user|
    user.resources :galleries
  end

  map.resources :galleries
    
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
