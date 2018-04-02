OptimacmsOptions::Engine.routes.draw do
#Rails.application.routes.draw do
  scope '/'+Optimacms.config.admin_namespace do
    scope module: 'admin', as: 'admin' do
      # options
      resources :options do
        collection do
          post 'search'
        end
      end
    end
  end
end
