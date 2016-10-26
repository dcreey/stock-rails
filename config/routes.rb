Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/company', to: 'company#index', as: 'company'
  match '/company/history/:id' => 'company#get_history', :via => :get, :constraints => { :id => /[^\/]+/ }
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  # get 'pages/companies', to: :show, controller: 'companies'
end
