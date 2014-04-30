DeviseExample::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
      get 'user_providers' => 'user_providers#index'
      delete 'user_providers' => 'user_providers#destroy'
      
      post 'create_providers'=> 'create_providers#create' 
      get 'show_all_providers' => 'show_all_providers#index'
      
      post 'subscribe_to' => 'subscribe_to#create'
      delete 'subscribe_to' => 'subscribe_to#destroy'
      
      post 'content_area' => 'content_area#create'
      get 'content_area' => 'content_area#index'  
      delete 'content_area' => 'content_area#destroy'
      put 'content_area' => 'content_area#update'
      
      post 'content_element' => 'content_element#create'
      delete 'content_element' => 'content_element#destroy'
      put 'content_element' => 'content_element#update'
      
      get 'format' => 'format#index'
      post 'format'=> 'format#create'
      delete 'format' => 'format#destroy'
      put 'format'=> 'format#index'
      
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'
      put 'get_provider_content_elements' => 'get_provider_content_elements#index'
      
      post 'get_provider_subscriptions' => 'get_provider_subscriptions#create'
      
      post 'subscription_type' => 'subscription_type#create'
      delete 'subscription_type' => 'subscription_type#destroy'
      put 'subscription_type' => 'subscription_type#update'
      
      post 'delivery_mode' => 'delivery_mode#create'
      get 'delivery_mode' => 'delivery_mode#index'
      delete 'delivery_mode' => 'delivery_mode#destroy'
      put 'delivery_mode' => 'delivery_mode#update'
      
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
