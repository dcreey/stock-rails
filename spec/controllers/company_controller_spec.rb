require "rails_helper"

describe CompanyController, :type => :controller do

  it 'should do something' do
    get root_path
    expect(response).to redirect_to("/401.html")
  end
end