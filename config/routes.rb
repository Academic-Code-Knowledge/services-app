Rails.application.routes.draw do
  namespace :admin do
    get 'operation/index'
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
    get 'stage/index' 
    get 'order/index'
    get 'device/index'
    get 'service/index'
  end
end