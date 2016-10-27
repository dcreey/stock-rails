Rails.application.routes.draw do
  root :to => redirect('/company')
  scope '/company' do
    get '/', {:controller=>"company", :action=>"index"}
    scope '/:symbol', :constraints => { :symbol => /[^\/]+/ } do
      scope '/history' do
        get '/', {:controller=>"company", :action=>"get_history"}
      end
    end
  end
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
end
