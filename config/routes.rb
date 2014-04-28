DeviseExample::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
      get 'user_providers' => 'user_providers#index'
      post 'user_providers' => 'user_providers#create'
 
      post 'create_providers'=> 'create_providers#create' 
      
      post 'subscribe_to' => 'subscribe_to#create'
      
      post 'content_area' => 'content_area#create'
      get 'content_area' => 'content_area#index'  
      put 'content_area' => 'content_area#destroy'
      
      post 'content_element' => 'content_element#create'
      put 'content_element' => 'content_element#destroy'
      
      get 'format' => 'format#index'
      post 'format'=> 'format#create'
      put 'format' => 'format#destroy'
      
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'
      get 'show_all_providers' => 'show_all_providers#index'
      
      post 'get_provider_subscriptions' => 'get_provider_subscriptions#create'
      post 'subscription_type' => 'subscription_type#create'
      
      post 'delivery_mode' => 'delivery_mode#create'
      get 'delivery_mode' => 'delivery_mode#index'
      put 'delivery_mode' => 'delivery_mode#destroy'
      
    end
  end
  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
