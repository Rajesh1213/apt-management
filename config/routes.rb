Rails.application.routes.draw do

  devise_for :users

  # You can have the root of your site routed with "root"
  root 'static#index'

  get 'about' => 'static#about'
  get 'contact' => 'static#contact'
  get 'staff-login' => 'static#staff_login'
  get 'dashboards/supervisor/new-staff' => 'static#new_staff'

  get 'dashboards/tenant', controller: 'dashboards', action: 'tenant'
  get 'dashboards/assistant', controller: 'dashboards', action: 'assistant'
  get 'dashboards/supervisor', controller: 'dashboards', action: 'supervisor'
  get 'dashboards/manager', controller: 'dashboards', action: 'manager'


  #get ':controller(/:action(/:id))', controller: 'dashboards'
  # resources :dashboards do
  #   match "/users/:id"
  # end
  authenticate :user do
    resources :testimonials, only: [:new, :create, :edit, :update, :destroy]
    resources :rentals
    resources :dashboards, only: [:index ]
  end

  resources :testimonials
  resources :rental_invoices

  resources :tenants

  resources :rentals do
    resources :complaints, module: :rentals
    resources :rental_invoices
    resources :tenant_family_members
    resources :tenant_autos
  end

  resources :apartments do
    resources :complaints, module: :apartments
  end
  
  resources :staffs


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



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
