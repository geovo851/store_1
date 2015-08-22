authorization do
  role :guest do
    # add permissions for guests here, e.g.
     # has_permission_on :products, :to => :read
    has_permission_on :store, :to => [:index, :show, :search_products]
   end
  
  # permissions on other roles, such as
  role :admin do
    has_permission_on [:products, :categories, :carts, :order], :to => :manage
    has_permission_on :users, :to => :profile
    has_permission_on :store, :to => [:index, :show, :search_products]
    has_permission_on :admins, :to => :index

    has_permission_on :products_orders, :to => :create

  end

  role :user do
    has_permission_on :store, :to => [:index, :show, :search_products]
    # has_permission_on :products, :to => [:read, :create]
    
    has_permission_on :carts, :to => [:index, :show, :create, :read, :update, :delete]
    has_permission_on :order, :to => [:index, :show, :create, :read, :update, :delete]
    has_permission_on :users, :to => :profile
    # has_permission_on :products, :to => [:update, :delete] do
    #   if_attribute :user_id => is {user.id}
    # end
  end
  # See the readme or GitHub for more examples
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
