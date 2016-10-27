Rails.application.routes.draw do
  root to: 'company#index'
  # get '/company', to: 'company#index', as: 'company'
  match '/company/history/:symbol' => 'company#get_history', :via => :get, :constraints => { :symbol => /[^\/]+/ }
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  # get 'pages/companies', to: :show, controller: 'companies'
end
