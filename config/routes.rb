Rails.application.routes.draw do

  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  root 'accounts#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  resources :accounts do
    # adds update_password to the collection of REST routes
    # collection do
    #   patch 'update_password'
    # end
    patch 'update_password', on: :member
    patch 'update_categories', on: :member
    # not all posts/comments need to be nested
    resources :posts, shallow: true do
      resources :comments, only: [:index, :new, :create]
    end
  end
  resources :comments, only: [:edit, :update, :destroy]

  get 'posts', to: 'posts#index'
  get    'register', to: 'accounts#new'
  get    'login', to: 'sessions#new'
  post   'login', to:  'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get    'contact', to: 'company#index'
  get    'about', to: 'company#show'

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  #get 'profile', to: 'users#show'
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
