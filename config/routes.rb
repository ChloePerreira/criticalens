Rails.application.routes.draw do

  get "/", to: "home#index", as: :root

  get "/test_api", to: "api#test_api"
  
  get "/aperture_tally/:id", to: "api#aperture_tally"

  get "/shutter_tally/:id", to: "api#shutter_tally"
  
  get "/iso_tally/:id", to: "api#iso_tally"

  get "/critiques_received/:id", to: "api#critiques_received_tally"

  get "/critiques_given/:id", to: "api#critiques_given_tally"

  get "/critique", to: "critiques#index", as: :critiques

  get "/user/:id", to: "users#show", as: :show_user

  get "/dashboard", to: "home#dashboard", as: :dashboard

  get "/auth/flickr/callback", to: "session#create", as: :connect
  
  get "/logout", to: "session#destroy", as: :destroy_session

  post "/submit-photo", to: "photos#submit_photo", as: :submit_photo
  
  get "/photo/:id", to: "photos#show", as: :show_photo

  post "/submit-critique", to: "critiques#submit_critique", as: :submit_critique

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
