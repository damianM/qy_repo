authorization do
  
 role :guest do
    has_permission_on :site, :to => [ :index ]
  end

  role :user do
    includes :guest
  end
  
  role :admin do 
    includes :user
    has_permission_on :assets, :to => [ :create, :asset, :download, :destroy ]    
  end
  
end

privileges do
  privilege :manage, :includes => [ :new, :edit, :create, :update, :change_state ]
end
