Rails.application.routes.draw do

  # optimacms devise
  devise_for :cms_admin_users, Optimacms::Devise.config


  get 'debug/:action', to: 'debug#action'


  # for names
  root to: "home#index"


  mount OptimacmsOptions::Engine => "/", :as => 'cms_options'

  # !!! LAST row
  mount Optimacms::Engine => "/", :as => "cms"
end
