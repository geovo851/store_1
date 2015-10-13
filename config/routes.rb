Rails.application.routes.draw do
  resources :deliveries, only: [:edit, :update]
  resources :orders
  resources :products_orders
  post 'store/cart/update_quantity' => 'products_orders#update_quantity', 
        as: 'cart_update_quantity'

  resources :carts
  get 'carts' => 'orders#carts', as: 'orders_carts'
  
  resources :products
  resources :categories

  get 'admins' => 'admins#index', as: 'admins'

  devise_for :users

  get 'store/delivery' => 'store#delivery', as: 'store_delivery'
  get 'store/about' => 'store#about', as: 'store_about'
  get 'store/contact' => 'store#contact', as: 'store_contact'
  get 'store/cart/:id' => 'store#cart', as: 'store_cart'
  get 'store/search/:id' => 'store#search_products', as: 'store_search_products'
  get 'store/show/:id' => 'store#show', as: 'store_show_product'

  root 'store#index'
end
