Noroshi::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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

  resource :top, controller: :top, only: [] do
    post :create_user, format: false, defaults: { format: :json }
  end

  resources :connections
  resources :sns_connections

  namespace :api, format: false, defaults: { format: :json } do
    resource :beacons do
      post :put_up
      post :shutdown
      post :meet
      post :unlock
    end

    resources :town_quests do
      collection do
        post :around
      end
      member do
        post :approach
      end
    end

    namespace :sns do
      resource :facebook, controller: :facebook do
        get :tweet
        post :tweet
      end

      resource :twitter, controller: :twitter do
        get :tweet
        post :tweet
      end

      resource :google, controller: :google do
        get :tweet
        post :tweet
      end
    end
    resources :stages do
      collection do
        post :join
        post :continue
      end
      member do
        post :next_stage
      end
    end
    resources :gimmicks
    namespace :minagora_switch do
      resources :users
      resources :master_data
    end

    namespace :cyber_growth do
      resources :master_data
      resources :users do
        collection do
          post :save_data
          post :login
        end
      end
    end
  end

  get "/auth/:provider/callback" => "sns_connections#create"

  root to: "top#index"
end