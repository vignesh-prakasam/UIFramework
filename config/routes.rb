ResellerPortal::Application.routes.draw do

  get "order_form/index"
  get "map/index"
  get 'address/index'
  get 'login/index'
  get 'main/index'
  #resources :service_check

  #resources :tns        ,   only: [:index, :create]
  resources :equipments ,   only: [:index]
  #resources :orders     ,   only: [:index]
  resources :dids
  resources :main
  resources :order_form

  resources :login
  resources :payments   , path:'payments'


  #resources :line_items

  resources :addresses do
    collection do
      post :matching
      post :select
    end
  end

  resources :line_items do
    collection do
      get :set
    end
  end


  resources :orders   do
    collection do
      post :proceed_to_payments
    end
  end

  resources :payments do
    collection do
      post :accept
    end
  end

  resources :service_plan,  only: [:index]
  resources :equipments, only: [:index]

  get 'equipment_image_url' => 'products#equipment_image_url'
  get 'compare' => 'equipments#compare'
  post 'line_item_update_url' => 'line_items#line_item_update_url'
  get 'load_shopping_cart_url'  => 'orders#load_shopping_cart'

  #resources :service_check
  #
  #resources :tns        ,   only: [:index, :create]
  #resources :equipments ,   only: [:index]
  #resources :order      ,   only: [:index]
  #
  #resources :service_plan,  only: [:index]
  #
  #get 'compare' => 'equipments#compare'
  #
  #get 'set_users' => 'order#set_users'
  #
  #get 'equipment_image_url' => 'products#equipment_image_url'
  #
  #root :to => redirect("login")

  get 'home' => 'home#index'

  get 'maps' => 'map#index'

  root :to => 'home#index'





  #root 'services#check'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end