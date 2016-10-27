require "rails_helper"

# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I search for company name of "Apple"
  #   Then I see "Apple" company
  scenario 'User searches for a company' do
    visit root_path

    fill_in "name", :with => "Apple"
    click_button "Search"

    # has grid object - _companies.html.erb rendered
    page.find(:css, ".grid", :visible => true)
    # has svg object - _company_history.html.erb rendered
    page.find(:id, "historySVG", :visible => true)
  end

end
