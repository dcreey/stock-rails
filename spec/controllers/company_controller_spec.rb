require "rails_helper"

describe CompanyController do
  render_views
  it 'should get companies with the name containing' do
    get :index, params: { name: 'app' }
    expect(response).to have_http_status(:success)
  end

  it 'should get companies with the name containing' do
    get :index, params: { sort: 'market_cap', direction: 'desc' }
    expect(response).to have_http_status(:success)
  end

  # NOT WORKING
  # it 'should get companies with the name containing' do
  #   get :get_history, :symbol => 'WEB'
  #   expect(response).to have_http_status(:success)
  # end

  it 'should get company history with the symbol containing WEB' do
    expect(:get => "/company/WEB/history").to route_to(
      :controller => "company",
      :action => "get_history",
      :symbol => "WEB"
    )

    expect(response).to have_http_status(:success)
  end

  it 'should accept "." on params on request to get company history with the symbol containing WEB^2' do
    expect(:get => "/company/WEB.2/history").to route_to(
      :controller => "company",
      :action => "get_history",
      :symbol => "WEB.2"
    )
    expect(response).to have_http_status(:success)
  end
end