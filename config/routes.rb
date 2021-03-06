Rails.application.routes.draw do
  root 'videos#show'
  
  get 'admin/videos'
  get 'admin/review/:id' => 'admin#review', :as => 'admin_review'
  post 'admin/approve' => 'admin#approve'
  get 'admin/vc_relations'
  post 'admin/vc_relations'
  get 'admin/vc_approve'

  get 'competitions/admin' => 'competitions#admin'
  get 'competitions/show_videos' => 'competitions#show_videos'
  post 'competitions/add_videos' => 'competitions#add_videos'
  get 'competitions/delete_videos' => 'competitions#delete_videos'

  resource :video_cart, only: [:show]
  resources :video_carts, only: [:destroy]
  resources :added_videos, only: [:create, :update, :destroy]
  resources :password_resets
  
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'videos/:id' => 'videos#show', :as => 'video_search'
  get 'videos/:search_params' => 'videos#search'
  post '/rate' => 'rater#create', :as => 'rate'

  
  resources :users, :sessions, :rater, :upload_videos, :videos, :admin, :competitions
  resources :videos do
    member do
      put "like" => "videos#upvote"
      put "unlike" => "videos#downvote"
    end
  end

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
