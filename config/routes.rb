OptimacmsOptions::Engine.routes.draw do
#Rails.application.routes.draw do
  get '/mmm/options', to: 'admin/options#index'

  scope '/cmsadmin' do
    #, module: "admin", as: 'admin' do
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
