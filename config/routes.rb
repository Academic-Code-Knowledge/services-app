Rails.application.routes.draw do  
  namespace :admin do
    get 'stages/index'
  end
  get "cam/index"
  devise_for :users
  get "home/index"
  get "home/landing"
  post "cam/save"
  root to: "home#landing"
  namespace :admin do
    get "home/index"
    get "home/index" => "home#index", :as => :root
    resources :services
    get "services/vaga/:id", action: :delete_service, controller: :services, as: :delete_service
    get "services/:id/stages", action: :service_stages, controller: :services, as: :service_stages
    resources :stages
  end
end