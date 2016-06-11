Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'welcome/index'

  root 'welcome#index'

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
      resources :compartment_carriages, shallow: true
      resources :second_class_carriages, shallow: true
      resources :sit_carriages, shallow: true
      resources :sv_carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_info, on: :member
    end
    resources :routes
    resources :railway_stations_routes
    resources :tickets
    get 'console/index'
  end

  resources :tickets, except: [:edit]

  resource :search, only: [:show] do
    post :search, on: :member
  end

  # The priority is based upon order of creation: first created ->
  # highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with
  # purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
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
