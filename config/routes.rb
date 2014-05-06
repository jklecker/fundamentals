DeviseExample::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        get 'sessions' => 'sessions#index'
      end
      get 'user_providers' => 'user_providers#index'
      delete 'user_providers' => 'user_providers#destroy'
      
      post 'create_providers'=> 'create_providers#create' 
      get 'show_all_providers' => 'show_all_providers#index'
      
      post 'subscribe_to' => 'subscribe_to#create'
      put 'subscribe_to' => 'subscribe_to#destroy'
      
      put 'hide_subscribe_to' => 'hide_subscribe_to#update'
      
      post 'content_area' => 'content_area#create'
      get 'content_area' => 'content_area#index'   
      put 'content_area' => 'content_area#update'
       
      put 'delete_content_area' => 'delete_content_area#destroy'
      
      post 'content_element' => 'content_element#create'
      put 'content_element' => 'content_element#update'
      
      put 'delete_content_element' => 'delete_content_element#destroy'
      
      get 'format' => 'format#index'
      post 'format'=> 'format#create'
      put 'format'=> 'format#update'
      
      put 'delete_format' => 'delete_format#destroy'
      
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'
      put 'get_provider_content_elements' => 'get_provider_content_elements#update'
      
      post 'get_provider_subscriptions' => 'get_provider_subscriptions#create'
      
      post 'get_provider_subscription_types' => 'get_provider_subscription_types#create'
      
      post 'subscription_type' => 'subscription_type#create'
      put 'subscription_type' => 'subscription_type#update'
      
      put 'delete_subscription_type' => 'delete_subscription_type#destroy'
      
      post 'delivery_mode' => 'delivery_mode#create'
      get 'delivery_mode' => 'delivery_mode#index'
      put 'delivery_mode' => 'delivery_mode#update'
      
      put 'delete_delivery_mode' => 'delete_delivery_mode#destroy'
      
      post 'search_providers' => 'search_providers#create'
      
      post 'forgot_password' => 'forgot_password#create'

      get 'renew_subscription' => 'renew_subscription#index'#returns all user providers

    end
  end
  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
