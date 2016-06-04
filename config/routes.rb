OptimacmsOptions::Engine.routes.draw do
#Rails.application.routes.draw do
  #get '/mmm/options', to: 'admin/options#index'

  scope '/'+Optimacms.admin_namespace, module: "admin" do
      # options
      resources :options do
        collection do
          post 'search'
        end
      end
  end
end
