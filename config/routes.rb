Rails.application.routes.draw do
  get "cam/index"
  devise_for :users
  get "home/index"
  post "cam/save"
  root to: "home#index"
  namespace :admin do
    get "home/index"
    get "home/index" => "home#index", :as => :root
  end
end