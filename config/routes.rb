Rails.application.routes.draw do
  
  get "cam/index"

  devise_for :users
  get "home/index"
  get "home/landing"
  post "cam/save"
  root to: "home#landing"


    resources :users do
      resources :orders, only: [:index, :show, :create]
    end
 

  namespace :admin do
    get "home/index"
    get "home/index" => "home#index", :as => :root
    get 'stage/index' 
    get 'order/index'
    get 'device/index'
    get 'service/index'
    get 'invoice/index'
  end


  
  resources :orders do
    resources :operations, only: [:index, :show, :create]
  end
 
end