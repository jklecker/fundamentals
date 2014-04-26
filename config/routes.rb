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
      post 'content_element' => 'content_element#create'
      get 'format' => 'format#index'
      post 'format'=> 'format#create'
      post 'get_provider_content_elements' => 'get_provider_content_elements#create'
      get 'show_all_providers' => 'show_all_providers#index'
    end
  end
  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
