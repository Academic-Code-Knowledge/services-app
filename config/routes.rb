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
    get 'stages/index'
    get 'operation/index'
    get "home/index"
    get "operation/index"
    get "operation/procesar"
    get "home/index" => "home#index", :as => :root
    get 'stage/index' 
    get 'order/index'
    get 'device/index'
    get 'service/index'
    get 'invoice/index'
    get 'order/new'
    get 'order/show'
    post 'order/create'
    resources :services
    get "services/vaga/:id", action: :delete_service, controller: :services, as: :delete_service
    get "services/:id/stages", action: :service_stages, controller: :services, as: :service_stages
    resources :stages
    resources :orders do
      resources :operations, only: [:index, :show, :create]
    end
  end
end
