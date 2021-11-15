Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  namespace :admin do
    get 'home/index'
    get 'home/index' => 'home#index', :as => :root
    get 'order/new'
    get 'order/show'
    post 'order/create'
  end
end
