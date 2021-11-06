Rails.application.routes.draw do
  get "cam/index"
  devise_for :users
  get "home/index"
  get "home/landing"
  post "cam/save"
  root to: "home#landing"
  namespace :admin do
    get "home/index"
    get "home/index" => "home#index", :as => :root
  end
end